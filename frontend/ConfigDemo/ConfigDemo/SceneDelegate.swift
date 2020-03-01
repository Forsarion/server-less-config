//
//  SceneDelegate.swift
//  ConfigDemo
//
//  Created by Andrii Moskvin on 29.02.2020.
//  Copyright © 2020 Forsarion. All rights reserved.
//

import UIKit
import SwiftUI
import Core

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { fatalError() }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: ContentView())
        self.window = window
        window.makeKeyAndVisible()
    }
}

