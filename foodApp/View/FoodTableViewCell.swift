//
//  FoodTableViewCell.swift
//  foodApp
//
//  Created by Christian Willson on 06/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit

protocol FormTableViewCellDelegate: AnyObject {
    func fieldValueChanged(itemRow: Int, itemCol: Int, itemName: UILabel, qtyTextField: UITextField)
}

class FoodTableViewCell: UITableViewCell {
    
    weak var delegate: FormTableViewCellDelegate?

    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var qtyTextField: UITextField!
    
    @IBOutlet weak var qtyStepperAsOutlet: UIStepper!
    
    
    @IBAction func qtyStepper(_ sender: UIStepper) {
        qtyTextField.text = String(Int(sender.value))
        delegate?.fieldValueChanged(itemRow: row, itemCol: col, itemName: itemName, qtyTextField: qtyTextField)

    }
    
    @IBAction func qtyTextFieldChange(_ sender: UITextField) {
        if qtyTextField.text != "" {
            qtyStepperAsOutlet.value = Double(qtyTextField.text!)!
            delegate?.fieldValueChanged(itemRow: row, itemCol: col, itemName: itemName, qtyTextField: qtyTextField)
        }
        
    }
    
    var row: Int = 0
    var col: Int = 0
    
    var qty: Int! {
        didSet {
            if qty != 0 {
                qtyTextField.text = String(qty)
                qtyStepperAsOutlet.value = Double(qty)
            } else {
                qtyTextField.text = ""
                qtyStepperAsOutlet.value = 0.0
            }
        }
    }
    
    
    var menuItem: ItemDetail! {
        didSet {
            itemImage.image = UIImage(named: menuItem.imageName)
            itemName.text = menuItem.itemName
            itemPrice.text = "IDR " + String(menuItem.itemPrice)
        }
    }
    
}
