//
//  ContentView.swift
//  ConfigDemo
//
//  Created by Andrii Moskvin on 29.02.2020.
//  Copyright © 2020 Forsarion. All rights reserved.
//

import SwiftUI

struct Environment {
    let name: String
    let apiUrl: String
    let authUrl: String
}

struct ContentView: View {
    @ObservedObject var config = ConfigService()
    
    var body: some View {
        switch config.state {
        case .undefined:
            return AnyView(Text("Undefined!"))
        case .loading:
            return AnyView(ActivityIndicator(isAnimating: .constant(true), style: .large))
        case .environment(let environment):
            return AnyView(EnvironmentView(environment: .constant(environment)))
        case .error(let error):
            return AnyView(Text(error.localizedDescription))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView(
//                props: .environment(.init(
//                    name: "dev",
//                    apiUrl: "https://dev.api.com",
//                    authUrl: "https://dev.auth.com")))
//            ContentView(props: .loading)
//            ContentView(props: .error("Some Error!"))
//            ContentView(props: .undefined)
//        }
//    }
//}
