import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let apiService = APIClient(session: URLSession.shared)
        let view = WeatherViewController()
        let presenter = WeatherPresenter(view: view, service: apiService, locationService: LocationService(), preferencesService: UserDefaults.standard)
        presenter.urlBuilder = URLBuilder(baseURL: Constants.API.baseURL)
        view.presenter = presenter
        
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: view)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
