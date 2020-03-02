//
//  ConfigFetcher.swift
//  ConfigDemo
//
//  Created by Andrii Moskvin on 01.03.2020.
//  Copyright © 2020 Forsarion. All rights reserved.
//

import Foundation
import Core
import Combine

final class ConfigService: ObservableObject {
    enum State {
        case undefined
        case loading
        case error(Error)
        case environment(Environment)
    }
    
    @Published var state = State.undefined

    private var cancellable: AnyCancellable?

    convenience init(state: State) {
        self.init()
        self.state = state
    }
    
    init() {
        do {
            var request = URLRequest(url: URL(string: "https://84rkr0rn1j.execute-api.eu-central-1.amazonaws.com/production/config")!)
            let body = try JSONEncoder().encode(Input(environment: .init(value: "value")))
            request.httpBody = body
            request.httpMethod = "POST"
            
            self.state = .loading
            
            self.cancellable = URLSession.DataTaskPublisher(request: request, session: .shared)
                .map { $0.data }
                .decode(type: Output.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error): self.state = .error(error)
                    case .finished: break
                    }
                }, receiveValue: { output in
                    self.state = .environment(.init(name: output.environment.value,
                                                    apiUrl: output.api.value,
                                                    authUrl: output.auth.value ))
                })
        } catch let error {
            self.state = .error(error)
        }
        
    }
}
