//
//  ItemCategory.swift
//  foodApp
//
//  Created by Christian Willson on 07/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import Foundation

struct ItemCategory {
    var category: String
    var itemDetail: [ItemDetail]
    
    static func fetchData() -> [ItemCategory]{
        var result = [ItemCategory]()
        
        
        let menuData = MenuItem.loadMenuData()
        for (_, dict) in menuData {
//            print(category)
            if let dict = dict as? [String: Any] {
                let categoryName = dict["categoryName"] as! String
                if let itemDetail = dict["itemDetail"] as? [ItemDetail] {
                    let newItemCategory = ItemCategory(category: categoryName, itemDetail: itemDetail)
                    result.append(newItemCategory)
                }
            }
        }

        return result
    }
}


class MenuItem {
    
    class func loadMenuData() -> [String: Any] { //what is class func? What is nested class?
        return [
            "Foods" : [
                "categoryName" : "Food",
                "itemDetail" : ItemDetail.groupByFood()
            ],
            "Drinks" : [
                "categoryName" : "Drink",
                "itemDetail" : ItemDetail.groupByDrink()
            ]
        ]
    }

    
}

