import UIKit

public extension UIApplication {
    
    /// Get visible ViewController from the app's keyWindow
    var visibleViewController: UIViewController? {

        guard let rootViewController = keyWindow?.rootViewController else {
            return nil
        }
        return getVisibleViewController(rootViewController)
    }

    /// Getting visible ViewController that is presented by UIViewController, UINavigationController or UITabbarController
    ///
    /// - Returns: Presented View Controller
    func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {

        if let presentedViewController = rootViewController.presentedViewController {
            return getVisibleViewController(presentedViewController)
        }

        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        }

        if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        }

        return rootViewController
    }
    
    /// Current top shown view controller
    var topMostViewController: UIViewController? {
		mainKeyWindow?.rootViewController?.topMostViewController
	}
    
	/// Main Key Window for iOS 13+
	var mainKeyWindow: UIWindow? {
		UIApplication.shared.connectedScenes
			.filter { $0.activationState == .foregroundActive }
			.first(where: { $0 is UIWindowScene })
			.flatMap { $0 as? UIWindowScene }?.windows
			.first(where: \.isKeyWindow)
	}
}
