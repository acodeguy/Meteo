import Foundation

class WeatherPresenter: WeatherPresenterProtocol {
    var view: WeatherViewProtocol
    var service: ServiceProtocol
    
    required init(view: WeatherViewProtocol, service: ServiceProtocol) {
        self.view = view
        self.service = service
    }
    
    func showWeather(for woeid: String = "721943") {
        guard let url = URL(string: "\(Constants.API.baseURL)/location/\(woeid)") else { return }
        
        service.fetch(url: url) { result in // urlsession may be the problem; inject it!
            switch result {
            case .success(let response):
                self.view.setWeather(weatherResponse: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
