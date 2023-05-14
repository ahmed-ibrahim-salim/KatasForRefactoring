//
//  Item.swift
//  Trivia
//
//  Created by magdy khalifa on 14/05/2023.
//  Copyright © 2023 Legacy Coderetreat. All rights reserved.
//

import Foundation

public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
    func updateQuality(){}

}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
    
}
