//
//  OrderDetailTableViewCell.swift
//  foodApp
//
//  Created by Christian Willson on 06/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemQty: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    var _orderData: OrderData! {
        didSet {
            if _orderData.itemName == "Tax" {
                itemQty.text = String(_orderData.itemQty) + "%"
            } else {
                itemQty.text = String(_orderData.itemQty) + "x"
            }
            
            itemName.text = _orderData.itemName
            itemPrice.text = "IDR " + String(_orderData.subTotal)
        }
    }
    
}
