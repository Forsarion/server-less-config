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
    @ObservedObject var config: ConfigService
    
    init() {
        self.config = ConfigService()
    }
    
    init(state: ConfigService.State) {
        self.config = ConfigService(state: state)
    }
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(state: .environment(.init(
                name: "dev",
                apiUrl: "https://dev.api.com",
                authUrl: "https://dev.auth.com")))
            ContentView(state: .undefined)
            ContentView(state: .error(PreviewError(text: "Some error!")))
            ContentView(state: .loading)
        }
    }
}

struct PreviewError: Swift.Error {
    let text: String
    
    var localizedDescription: String {
        return text
    }
}
