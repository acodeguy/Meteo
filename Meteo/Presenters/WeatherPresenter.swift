import UIKit

class WeatherPresenter: WeatherPresenterProtocol {   
    var view: WeatherViewProtocol
    var service: APIClientProtocol
    var locationService: LocationServiceProtocol
    var preferencesService: PreferencesServiceProtocol
    var urlBuilder: URLBuilderProtocol?
    
    required init(view: WeatherViewProtocol, service: APIClientProtocol, locationService: LocationServiceProtocol, preferencesService: PreferencesServiceProtocol) {
        self.view = view
        self.service = service
        self.locationService = locationService
        self.preferencesService = preferencesService
    }
    
    func updateCurrentLocation() {
        view.setInformationPanel("Updating your location...")
        locationService.getCurrentLocation { currentLocation in
            self.getLocationMatches(from: currentLocation) { locationMatches in
                guard let woeid = locationMatches.first?.woeid else { return }
                
                self.showWeather(for: woeid)
            }
        }
    }
    
    func getLocationMatches(from coordinate: LocationProtocol, completion: @escaping ([WeatherLocation]) -> Void) {
        view.setInformationPanel("Getting location matches from API...")
        let query = "\(coordinate.latitude),\(coordinate.longitude)"
        guard let url = urlBuilder?.build(for: .locations, with: query) else { return }
        
        service.fetch(dataType: [WeatherLocation].self, from: url) { result in
            switch result {
            case .success(let locations):
                completion(locations)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func showWeather(for woeid: Int) {
        guard let url = urlBuilder?.build(for: .woeid, with: String(woeid)) else { return }
        
        service.fetch(dataType: WeatherResponse.self, from: url) { result in
            switch result {
            case .success(let response):
                guard let weather = response.weather.first else { return }
                
                var temperatureString = ""
                let temperature = weather.temperature
                
                switch self.preferencesService.integer(forKey: Constants.PreferencesKeys.temperatureUnit) {
                case TemperatureUnit.celsius.rawValue:
                    temperatureString = "\(round(weather.temperature)) ℃"
                case TemperatureUnit.fahrenheit.rawValue:
                    temperatureString = "\(temperature.toFahrenheit()) ℉"
                default:
                    break
                }
                
                DispatchQueue.main.async {
                    self.view.titleLabel.attributedText = "\(response.title), \(response.locationInfo.countryName)".center()
                    self.view.temperatureLabel.attributedText = temperatureString.center()
                }
                
                self.fetchWeatherIcon(for: weather.stateAbbreviation)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchWeatherIcon(for state: String) {
        guard let url = urlBuilder?.build(for: .icon, with: state) else { return }
                
        service.fetchRawData(from: url) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.view.setWeatherImage(with: image, using: DispatchQueue.main)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
