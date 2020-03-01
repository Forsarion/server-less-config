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

    @State var props = Props.loading
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        do {
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: "https://84rkr0rn1j.execute-api.eu-central-1.amazonaws.com/production/config")!)
            let body = try JSONEncoder().encode(Input(environment: .init(value: "value")))
            request.httpBody = body
            request.httpMethod = "POST"
            session.dataTask(with: request) { (data, response, error) in
                print(response ?? "no response")
                print(error ?? "no error")
                
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8) ?? "no string")
                guard let output = try? JSONDecoder().decode(Output.self, from: data) else { return }
                print(output)
                self.props = Props.environment(.init(name: output.environment.value,
                                                     apiUrl: output.api.value,
                                                     authUrl: output.auth.value))
            }.resume()
        } catch let error {
            print(error)
        }
    
        let contentView = ContentView(props: $props)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
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

