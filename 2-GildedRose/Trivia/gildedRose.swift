//
//  gildedRose.swift
//  Trivia
//
//  Created by magdy khalifa on 14/05/2023.
//  Copyright © 2023 Legacy Coderetreat. All rights reserved.
//

import Foundation
public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }
    
    
    
    
    func checkQualityMoreThanZeroAndNotSulfuras(i: Int){
        if items[i].quality > 0 {
            if items[i].name != "Sulfuras, Hand of Ragnaros" {
                items[i].quality -= 1
            }
        }
    }
    
    func whenQualitylowerThan50(i: Int){
        if items[i].quality < 50 {
            items[i].quality += 1
        }
    }
    public func updateQuality() {
        for i in items{
            i.updateQuality()
        }
//                0 ..< items.count {
            
//            // phase one
//            if items[i].name != "Aged Brie", items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
//                checkQualityMoreThanZeroAndNotSulfuras(i: i)
//
//            } else {
//                if items[i].quality < 50 {
//                    items[i].quality += 1
//
//                    if items[i].name == "Backstage passes to a TAFKAL80ETC concert" {
//                        if items[i].sellIn < 11 {
//                            items[i].quality += 1
//                        }
//
//                        if items[i].sellIn < 6 {
//                            items[i].quality += 1
//                        }
//                    }
//                }
//            }
//
//            // phase 2
//            if items[i].name != "Sulfuras, Hand of Ragnaros" {
//                items[i].sellIn -= 1
//            }
//
//            // phase 3 SellIn
//            if items[i].sellIn < 0 {
//                if items[i].name != "Aged Brie" {
//                    if items[i].name != "Backstage passes to a TAFKAL80ETC concert" {
//                        checkQualityMoreThanZeroAndNotSulfuras(i: i)
//                    } else {
//                        items[i].quality -= items[i].quality
//                    }
//                } else {
//                    whenQualitylowerThan50(i: i)
//
//                }
//            }
//        }
    }
}
class Conjured: Item{
    override
    func updateQuality(){
        // phase one
        if quality > 0 {
            quality -= 2
        }
        
        // phase 2 because it is "Sulfuras, Hand of Ragnaros"
        sellIn -= 1

        // phase 3
        if quality > 0 {
           quality -= 2
        }
    }
}
class Normal: Item{
    override func updateQuality(){
        // phase one
        if quality > 0 {
            quality -= 1
        }
        
        // phase 2 because it is "Sulfuras, Hand of Ragnaros"
        sellIn -= 1

        // phase 3
        if quality > 0 {
           quality -= 1
        }
    }
}

class Sulfuras: Item{
    override func updateQuality(){
        // phase one
        
        
        // phase 2 because it is "Sulfuras, Hand of Ragnaros"
        
        // phase 3
        if sellIn < 0 {
            if quality < 50 {
                quality += 1
            }
            
        }
    }
}
class TAFKAL80ETCconcert: Item{
    
    override init(name: String, sellIn: Int, quality: Int) {
        super.init(name: name, sellIn: sellIn, quality: quality)
    }

    override func updateQuality(){
        // phase one
        if quality < 50{
            quality += 1
            
            if sellIn < 11 {
                quality += 1

            }

            if sellIn < 6 {
                quality += 1
            }
        }
        
        // phase 2 because it is not "Sulfuras, Hand of Ragnaros"
        sellIn -= 1
        
        
        // phase 3
        if sellIn < 0 {
            quality -= quality
        }
    }
}


class AgedBrie: Item{
    override func updateQuality(){
        // phase one
        if quality < 50{
            quality += 1
        }
        
        // phase 2 because it is "Sulfuras, Hand of Ragnaros"
        sellIn -= 1
        
        // phase 3
        if sellIn < 0 {
            quality += 1
            
        }
    }
}

//Sulfuras

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
