//
//  SceneDelegate.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        window?.rootViewController = MapViewController()
        window?.makeKeyAndVisible()
        
        let navBar = UITabBarController()       //The navigation bar that is used to navigate b/w Map|Music|Books|Settings
        let navBarVCs = [UINavigationController(rootViewController: MapViewController()),
                         MusicViewController(),
                         UINavigationController(rootViewController: ViewController()),
                         UINavigationController(rootViewController: ViewController())]
            
        
        let navBarItems = [UITabBarItem (title: "Map",        image: UIImage(systemName: "map.fill"), tag: 0),
                           UITabBarItem (title: "Music",      image: UIImage(systemName: "music.note"), tag: 1),
                           UITabBarItem (title: "Audiobooks", image: UIImage(systemName: "book.fill"), tag: 2),
                           UITabBarItem (title: "Settings",   image: UIImage(systemName: "gear"), tag: 3)]
        
        navBar.viewControllers = navBarVCs.enumerated().map({ (index, navController) -> UIViewController in
            navController.tabBarItem = navBarItems[index]
            return navController
        })
        
        navBar.tabBar.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
        navBar.tabBar.tintColor = .black
        navBar.tabBar.barTintColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
        navBar.selectedIndex = 1
        print (navBar.tabBar.bounds.size.height)
        window?.rootViewController = navBar
        window?.makeKeyAndVisible()
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


