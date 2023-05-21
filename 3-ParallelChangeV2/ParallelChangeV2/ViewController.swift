//
//  ViewController.swift
//  ParallelChangeV2
//
//  Created by magdy khalifa on 21/05/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        runExample()
        run_Client()
    }

    func runExample() {
        let shoppingCart = ShoppingCartWithList()
        shoppingCart.add(10)
        print("number of products: \(shoppingCart.numberOfProducts())")
        print("total price: \(shoppingCart.calculateTotalPrice())")
        print("has discount: \(shoppingCart.hasDiscount())")
    }
    func run_Client() {
        let client = AuthenticationClient(authenticationService: AuthenticationService())
        client.run()
    }
}

