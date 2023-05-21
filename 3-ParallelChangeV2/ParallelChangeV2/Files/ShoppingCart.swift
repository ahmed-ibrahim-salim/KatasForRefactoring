//
//  ShoppingCart.swift
//  ParallelChangeV2
//
//  Created by magdy khalifa on 21/05/2023.
//

import Foundation

class ShoppingCart {
    var price = 0

    // the goal is to remove a field above, replacing with
    // `prices = []`

    func add(_ price: Int) {
        self.price = price
    }

    func numberOfProducts() -> Int {
        return 1
    }

    func calculateTotalPrice() -> Int {
        return self.price
    }

    func hasDiscount() -> Bool {
        return self.price >= 100
    }
}
