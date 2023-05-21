//
//  ShoppingCart.swift
//  ParallelChangeV2
//
//  Created by magdy khalifa on 21/05/2023.
//

import Foundation

//class ShoppingCart {
//    var price = 0
//
//    // the goal is to remove a field above, replacing with
//    // `prices = []`
//
//    func add(_ price: Int) {
//        self.price = price
//    }
//
//    func numberOfProducts() -> Int {
//        return 1
//    }
//
//    func calculateTotalPrice() -> Int {
//        return self.price
//    }
//
//    func hasDiscount() -> Bool {
//        return self.price >= 100
//    }
//}


// Solution
class ShoppingCartWithList {
    var prices: [Int] = []

    // the goal is to remove a field above, replacing with
    // `prices = []`

    func add(_ price: Int) {
        self.prices.append(price)
    }

    func numberOfProducts() -> Int {
        return prices.count
    }

    func calculateTotalPrice() -> Int {
        var finalResult = 0
        
        for price in self.prices{
            finalResult += price
        }
        
        return finalResult
    }

    func hasDiscount() -> Bool {
        
        for price in prices {
            return price >= 100
        }
        
        return false
    }
}
