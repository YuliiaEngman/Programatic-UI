//
//  SceneDelegate.swift
//  Programatic-UI
//
//  Created by Yuliia Engman on 1/28/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // iOS 13 now has a SceneDelegate, this is where the window property is /
    // in order to setup your programatic
   // UI code you must set the
    // rootViewController property of the window
    // e.g. window.rootViewController = ViewController
    
    // Steps in removing the default Main.stroyboard file - we do not need to remove it from app, but from info.plist:
    // 1. Delete "Main stotybiard" entry from the info.plist
    // 2. Delete storyboard value from the "Scene configuration"
    // 3. After (optional) we delete the Main.storyboard file l

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Speps in configuring programatic UI in the SceneDelegate
        // Steps in configuring the window property
        
        // change _ to windowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 1. Set up the Window's frame take up the entire device's screen
        // instantiating the window witha frame
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        //window?.rootViewController = SettingsViewController()
        
        // embading a UIViewController in a UINavigationController
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
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
