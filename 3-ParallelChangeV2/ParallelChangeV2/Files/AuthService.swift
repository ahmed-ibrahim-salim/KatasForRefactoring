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

    
    func isAuthenticated(_ userId: Int, role: Role) -> Bool {
        let admin = Admin()
        return userId == admin.userId
    }
}

protocol Role{
    var userId: Int {get}
}
class Admin: Role{
    let userId = 12345
}
class NormalUser: Role{
    let userId = 1111
}

class AuthenticationClient {
    let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func run() {
        let admin = Admin()
        let authenticated = authenticationService.isAuthenticated(33, role: admin)
        print("authenticated: \(authenticated)")
    }
}
