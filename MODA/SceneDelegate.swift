//
//  SceneDelegate.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 윈도우 생성
        let window = UIWindow(windowScene: windowScene)
        
        // 두 개의 뷰 컨트롤러 생성
        let mainViewController = MainViewController()
        let myPageViewController = MyPageViewController()
        
        // "메인" 탭 바 아이콘 설정
        let mainIcon = UIImage(systemName: "play.rectangle")
        mainViewController.tabBarItem = UITabBarItem(title: "메인", image: mainIcon, tag: 0)
        
        // "마이페이지" 탭 바 아이콘 설정
        let myPageIcon = UIImage(systemName: "person.crop.rectangle")
        myPageViewController.tabBarItem = UITabBarItem(title: "마이페이지", image: myPageIcon, tag: 1)
        
        // 탭 바 컨트롤러 생성
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mainViewController, myPageViewController]
        
        // 윈도우 루트 뷰 컨트롤러 설정
        window.rootViewController = tabBarController
        
        // 윈도우를 표시
        self.window = window
        window.makeKeyAndVisible()
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

