//
//  AuthService.swift
//  ParallelChangeV2
//
//  Created by magdy khalifa on 21/05/2023.
//

import Foundation

class AuthenticationService {

    //
    // the goal is to replace the method above with this one:
    // func isAuthenticated(role, userId)
    //

    func isAuthenticated(_ userId: Int) -> Bool {
        return userId == 12345
    }
}

class AuthenticationClient {
    let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func run() {
        let authenticated = authenticationService.isAuthenticated(33)
        print("authenticated: \(authenticated)")
    }
}
