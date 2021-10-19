//
//  DetailViewController.swift
//  foodApp
//
//  Created by Christian Willson on 06/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var orderDetailTableView: UITableView!
    
    
    var userOrder = [String: Int]()
    var itemDetail = ItemDetail.populateData()
    
    var orderData = [OrderData]()
    
    var tax: OrderData!
    
    var grandTotalResult = 0
    var subTotalResult = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.orderDetailTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        orderDetailTableView.delegate = self
        orderDetailTableView.dataSource = self
        
        fetchUserOrderData()
        
    }
    
    func fetchUserOrderData() {
        var tmp: OrderData = OrderData()
        for (_kind, _qty) in userOrder {
            
            tmp.itemName = _kind
            tmp.itemQty = _qty
            
            for i in 0..<itemDetail.count {
                if itemDetail[i].itemName == _kind {
                    grandTotalResult = grandTotalResult + (itemDetail[i].itemPrice * _qty)
                    tmp.subTotal = itemDetail[i].itemPrice * _qty
                }
            }
            
            orderData.append(tmp)
            
            tax = OrderData(itemName: "Tax", itemQty: 10, subTotal: grandTotalResult * 10 / 100)
            subTotalResult = grandTotalResult
            grandTotalResult = grandTotalResult + (grandTotalResult * 10/100)
        
        }
        
        
    }
    
    

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderData.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item >= orderData.count {
            if indexPath.item == orderData.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: "orderDetailTableViewCell", for: indexPath) as! OrderDetailTableViewCell
                cell._orderData = tax
                return cell
            } else {
               let cell = tableView.dequeueReusableCell(withIdentifier: "GrandTotalTableViewCell", for: indexPath) as! GrandTotalTableViewCell
                cell.grandTotal = String(grandTotalResult)
                cell.subTotal = String(subTotalResult)
                cell.grandTotalDelegate = self
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderDetailTableViewCell", for: indexPath) as! OrderDetailTableViewCell
            
            cell._orderData = orderData[indexPath.item]
            
            return cell
        }
        
        
    }
    
    
}

extension DetailViewController: GrandTotalDelegate {
    func confirmBtn(isPress: Bool) {
        if isPress {
            print(orderData)
            let alert = UIAlertController(title: "Confirmation", message: "Thank you for ordering.", preferredStyle: .alert)
    
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                guard let mainNavigationVC = mainStoryboard.instantiateViewController(identifier: "NavigationController") as? NavigationController else {
                    return
                }
    
                mainNavigationVC.modalPresentationStyle = .fullScreen
                self.present(mainNavigationVC, animated: true)
            }))
    
    
            present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
}
