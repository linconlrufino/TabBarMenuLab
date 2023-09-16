//
//  SceneDelegate.swift
//  TabBarMenuLab
//
//  Created by Linconl Rufino on 08/09/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func createTabBar() -> UITabBarController {
        
        let tabBar = UITabBarController()
        let flagVC = createFlagViewController()
        let viewVC1 = createHomeNavigationController()
        let viewVC2 = createUIViewController2()
    
        tabBar.viewControllers = [flagVC, viewVC1, viewVC2]
        
        return tabBar
    }
    
    func createFlagViewController() -> FlagViewController {
        let flagVC = FlagViewController()
        flagVC.title = "Guess The Flag"
        flagVC.tabBarItem = UITabBarItem(title: "GuessTheFlag", image: UIImage(systemName: "flag"), tag: 0)
        
        return flagVC
    }
    
    func createUIViewController1() -> UIViewController {
        let xpto1VC = UIViewController()
        xpto1VC.title = "XPTO - 1"
        xpto1VC.view.backgroundColor = .systemBlue
        xpto1VC.tabBarItem = UITabBarItem(title: "XPTO1", image: nil, tag: 1)
        
        return xpto1VC
    }
    
    func createHomeNavigationController() -> UINavigationController {

        let homeVC = UIViewController()
        homeVC.title = "Home"
        homeVC.view.backgroundColor = .systemPink
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)

        return UINavigationController(rootViewController: homeVC)
    }
    
    func createUIViewController2() -> UIViewController {
        let xpto2VC = UIViewController()
        xpto2VC.title = "XPTO - 2"
        xpto2VC.tabBarItem = UITabBarItem(title: "XPTO2", image: nil, tag: 2)
        
        return xpto2VC
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let tabBar = createTabBar()
        
        window?.rootViewController = tabBar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

