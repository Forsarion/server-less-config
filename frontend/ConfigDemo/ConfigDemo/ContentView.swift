//
//  ContentView.swift
//  ConfigDemo
//
//  Created by Andrii Moskvin on 29.02.2020.
//  Copyright © 2020 Forsarion. All rights reserved.
//

import SwiftUI

enum Props {
    case loading
    case environment(Environment)
}

struct Environment {
    let name: String
    let apiUrl: String
    let authUrl: String
}

struct ContentView: View {
    @Binding var props: Props
    
    var body: some View {
        switch props {
        case .loading:
            return AnyView(ActivityIndicator(isAnimating: .constant(true), style: .large))
        case .environment(let environment):
            return AnyView(EnvironmentView(environment: environment))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(
                props: .constant(.environment(.init(
                    name: "dev",
                    apiUrl: "https://dev.api.com",
                    authUrl: "https://dev.auth.com"))))
            ContentView(props: .constant(.loading))
        }
    }
}
