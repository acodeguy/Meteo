import Foundation

class WeatherPresenter: WeatherPresenterProtocol {
    var view: WeatherViewProtocol
    var service: APIClientProtocol
    
    required init(view: WeatherViewProtocol, service: APIClientProtocol) {
        self.view = view
        self.service = service
    }
    
    func showWeather(for woeid: Int = 721943) {
        guard let url = URL(string: "\(Constants.API.baseURL)/location/\(woeid)") else { return }
        
        service.fetch(dataType: WeatherResponse.self, from: url) { result in
            switch result {
            case .success(let response):
                self.view.setWeather(weatherResponse: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
