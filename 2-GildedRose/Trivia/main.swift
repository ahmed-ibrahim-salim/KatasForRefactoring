//
//  main.swift
//  Trivia
//
//  Created by Oliver Eikemeier on 13.10.15.
//  Copyright © 2015 Legacy Coderetreat. All rights reserved.
//

import Foundation


let items = [
    Normal(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
    AgedBrie(name: "Aged Brie", sellIn: 2, quality: 0),
    Normal(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
    Sulfuras(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
    Sulfuras(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
    TAFKAL80ETCconcert(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
    TAFKAL80ETCconcert(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
    TAFKAL80ETCconcert(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
    // this conjured item does not work properly yet
    Conjured(name: "Conjured Mana Cake", sellIn: 3, quality: 6),
]

let app = GildedRose(items: items)

var days = 2
if CommandLine.argc > 1 {
    days = Int(CommandLine.arguments[1])! + 1
}

for i in 0 ..< days {
    print("-------- day \(i) --------")
    print("name, sellIn, quality")
    for item in items {
        print(item)
    }
    print("")
    app.updateQuality()
}



// older data
//-------- day 0 --------
//name, sellIn, quality
//+5 Dexterity Vest, 10, 20
//Aged Brie, 2, 0
//Elixir of the Mongoose, 5, 7
//Sulfuras, Hand of Ragnaros, 0, 80
//Sulfuras, Hand of Ragnaros, -1, 80
//Backstage passes to a TAFKAL80ETC concert, 15, 20
//Backstage passes to a TAFKAL80ETC concert, 10, 49
//Backstage passes to a TAFKAL80ETC concert, 5, 49
//Conjured Mana Cake, 3, 6
//
//-------- day 1 --------
//name, sellIn, quality
//+5 Dexterity Vest, 9, 19
//Aged Brie, 1, 1
//Elixir of the Mongoose, 4, 6
//Sulfuras, Hand of Ragnaros, 0, 80
//Sulfuras, Hand of Ragnaros, -1, 80
//Backstage passes to a TAFKAL80ETC concert, 14, 21
//Backstage passes to a TAFKAL80ETC concert, 9, 50
//Backstage passes to a TAFKAL80ETC concert, 4, 50
//Conjured Mana Cake, 2, 5
