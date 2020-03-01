//
//  EnvironmentView.swift
//  ConfigDemo
//
//  Created by Andrii Moskvin on 01.03.2020.
//  Copyright © 2020 Forsarion. All rights reserved.
//

import SwiftUI

struct EnvironmentView: View {
    @State var environment: Environment
    var body: some View {
        VStack {
            Text("Environment: \(environment.name)")
            Text("API Url: \(environment.apiUrl))")
            Text("Auth Url: \(environment.authUrl)")
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EnvironmentView(environment: .init(name: "name",
                                               apiUrl: "apiUrl",
                                               authUrl: "authUrl"))
        }
    }
}
