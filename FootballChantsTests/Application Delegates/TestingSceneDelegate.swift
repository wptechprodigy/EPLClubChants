//
//  TestingSceneDelegate.swift
//  FootballChantsTests
//
//  Created by waheedCodes on 29/10/2021.
//

import UIKit
@testable import FootballChants

@available(iOS 13, *)
class TestingSceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let scene = (scene as? UIWindowScene) else { return }
        let rootViewController = ChantsViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

