//
//  ViewController.swift
//  foodApp
//
//  Created by Christian Willson on 06/10/21.
//  Copyright © 2021 Christian Willson. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var menu = ItemCategory.fetchData()
    
    var userOrder = [String: Int]()
    
    var qty = [[Int]]()
    
    
    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var orderBtn: UIButton!
    @IBAction func orderBtnAct(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as? DetailViewController
        detailViewController?.userOrder = userOrder
    }
    
    func btnToggle() {
        if userOrder.isEmpty {
            orderBtn.isEnabled = false
            orderBtn.alpha = 0.5
        } else {
            orderBtn.isEnabled = true
            orderBtn.alpha = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...menu.count - 1 {
            var tmp = [Int]()
            for _ in 0...menu[i].itemDetail.count - 1 {
                tmp.append(0)
            }
            qty.append(tmp)
        }
        
        
        btnToggle()

        menuTable.delegate = self
        menuTable.dataSource = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func DismissKeyboard() {
        view.endEditing(true)
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menu[section].category
   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu[section].itemDetail.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodTableViewCell", for: indexPath) as! FoodTableViewCell
        
        
        cell.menuItem = menu[indexPath.section].itemDetail[indexPath.item]
        
        cell.qty = qty[indexPath.section][indexPath.item]
        cell.row = indexPath.section
        cell.col = indexPath.item
        
        cell.delegate = self
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    
    
    

}


extension ViewController: FormTableViewCellDelegate {
    
    func fieldValueChanged(itemRow: Int, itemCol: Int, itemName: UILabel, qtyTextField: UITextField) {

        qty[itemRow][itemCol] = Int(qtyTextField.text!)!
     

        if (String(qtyTextField.text!) == "0") {
            userOrder[itemName.text!] = nil
        } else {
            userOrder[itemName.text!] = Int(String(qtyTextField.text!))
        }
        
        btnToggle()
    }
}
