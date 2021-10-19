//
//  GrandTotalTableViewCell.swift
//  foodApp
//
//  Created by Willson on 14/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit

protocol GrandTotalDelegate: AnyObject {
    func confirmBtn(isPress: Bool)
}

class GrandTotalTableViewCell: UITableViewCell {
    @IBOutlet weak var subTotalLbl: UILabel!
    
    @IBOutlet weak var grandTotalLbl: UILabel!
    
    var grandTotalDelegate: GrandTotalDelegate?
    
    @IBAction func confirmBtn(_ sender: UIButton) {
        grandTotalDelegate?.confirmBtn(isPress: true)
    }
    
    var grandTotal: String! {
        didSet {
            grandTotalLbl.text = "Grand Total: IDR " + grandTotal
        }
    }
    
    var subTotal: String! {
        didSet {
            subTotalLbl.text = "Sub-Total (Before Tax): IDR: " + subTotal
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
