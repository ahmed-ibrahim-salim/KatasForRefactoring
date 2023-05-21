//
//  ParallelChangeV2Tests.swift
//  ParallelChangeV2Tests
//
//  Created by magdy khalifa on 21/05/2023.
//

import XCTest
@testable import ParallelChangeV2

final class ParallelChangeV2Tests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    
    func testAdministratorIsAlwaysAuthenticated() {
        let service = AuthenticationService()
        let admin = Admin()
//        let adminId = 12345
        XCTAssertTrue(service.isAuthenticated(admin.userId, role: admin))
    }
    
    func testNormalUserIsNotAuthenticatedInitially() {
        let service = AuthenticationService()
        let normalUser = NormalUser()
        XCTAssertFalse(service.isAuthenticated(normalUser.userId, role: normalUser))
    }
}
