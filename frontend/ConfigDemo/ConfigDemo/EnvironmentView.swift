//
//  EnvironmentView.swift
//  ConfigDemo
//
//  Created by Andrii Moskvin on 01.03.2020.
//  Copyright © 2020 Forsarion. All rights reserved.
//

import SwiftUI

struct EnvironmentView: View {
    @Binding var environment: Environment
    var body: some View {
        VStack {
            Divider()
            Text("Environment: \(environment.name)")
            Divider()
            Text("API Url: \(environment.apiUrl)")
            Divider()
            Text("Auth Url: \(environment.authUrl)")
            Divider()
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EnvironmentView(environment: .constant(.init(name: "name",
                                               apiUrl: "apiUrl",
                                               authUrl: "authUrl")))
        }
    }
}
