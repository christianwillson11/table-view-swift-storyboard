//
//  ItemDetail.swift
//  foodApp
//
//  Created by Christian Willson on 06/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import Foundation

struct ItemDetail {
    var category: String
    var imageName: String
    var itemName: String
    var itemPrice: Int
    
    
    static func populateData() -> [ItemDetail] {
        var result = [ItemDetail]()
        
        result = groupByFood() + groupByDrink()
        
        return result
        
    }
    
    static func groupByFood() -> [ItemDetail] {
        var result = [ItemDetail]()
        
        let menu1: ItemDetail = ItemDetail(category: "food", imageName: "cheese-burger", itemName: "Cheese Burger", itemPrice: 27500)
        let menu2: ItemDetail = ItemDetail(category: "food", imageName: "chicken-burger", itemName: "Chicken Burger", itemPrice: 30000)
        let menu3: ItemDetail = ItemDetail(category: "food", imageName: "sandwich", itemName: "Sandwich", itemPrice: 25000)
        let menu4: ItemDetail = ItemDetail(category: "food", imageName: "hotdog", itemName: "Hotdog", itemPrice: 30000)
        let menu5: ItemDetail = ItemDetail(category: "food", imageName: "french-fries", itemName: "Frech Fries", itemPrice: 16000)
        
        result.append(menu1)
        result.append(menu2)
        result.append(menu3)
        result.append(menu4)
        result.append(menu5)
        
        return result
    }
    
    static func groupByDrink() -> [ItemDetail] {
        var result = [ItemDetail]()
        let menu6: ItemDetail = ItemDetail(category: "drink", imageName: "pepsi", itemName: "Pepsi", itemPrice: 10000)
        let menu7: ItemDetail = ItemDetail(category: "drink", imageName: "coca-cola", itemName: "Coca Cola", itemPrice: 10000)
        let menu8: ItemDetail = ItemDetail(category: "drink", imageName: "fanta", itemName: "Fanta", itemPrice: 10000)
        let menu9: ItemDetail = ItemDetail(category: "drink", imageName: "sprite", itemName: "Sprite", itemPrice: 10000)
        let menu10: ItemDetail = ItemDetail(category: "drink", imageName: "milo", itemName: "Milo", itemPrice: 10000)
        
        result.append(menu6)
        result.append(menu7)
        result.append(menu8)
        result.append(menu9)
        result.append(menu10)
        
        return result
        
    }
}
