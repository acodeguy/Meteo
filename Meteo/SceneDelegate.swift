import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let service = WeatherAPIService(session: URLSession.shared)
        let view = WeatherViewController()
        let presenter = WeatherPresenter(view: view, service: service)
        view.presenter = presenter
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = view
        self.window = window
        window.makeKeyAndVisible()
    }
}
