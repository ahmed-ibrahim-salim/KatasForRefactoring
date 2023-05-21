//
//  ShoppingCartTests.swift
//  ParallelChangeV2Tests
//
//  Created by magdy khalifa on 21/05/2023.
//

import XCTest
@testable import ParallelChangeV2

final class ShoppingCartTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testCartMayJustHaveASingleItem() {
        let shoppingCart = ShoppingCart()
        shoppingCart.add(10);
        XCTAssertEqual(1, shoppingCart.numberOfProducts())
    }

    func testTheTotalPriceOfTheCartIsTotalOfItsContents() {
        let shoppingCart = ShoppingCart()
        shoppingCart.add(10);
        XCTAssertEqual(10, shoppingCart.calculateTotalPrice())
    }

    func testHasDiscountWhenContainsAtLeastOnePremiumItem() {
        let shoppingCart = ShoppingCart()
        shoppingCart.add(100);
        XCTAssertTrue(shoppingCart.hasDiscount())
    }

    func testDoesntHaveDiscountWhenAllItemsAreCheap() {
        let shoppingCart = ShoppingCart()
        shoppingCart.add(10);
        XCTAssertFalse(shoppingCart.hasDiscount())
    }
}
