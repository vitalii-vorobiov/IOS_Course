//
//  GasStationViewController.swift
//  Networking
//
//  Created by Markiian on 10/3/19.
//  Copyright © 2019 ucu. All rights reserved.
//

import Foundation
import UIKit

class GasSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gasPriceField: UITextField!
    var gasPrice: Float!
    
    @IBAction func okPressed(_ sender: Any) {
        if self.gasPrice != nil {
            print(self.gasPrice)
        }
    }
    @objc func priceFieldChanged(_ textField: UITextField) {
        self.gasPrice = Float(textField.text!) ?? 0.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gasPriceField.delegate = self
        gasPriceField.addTarget(self, action: #selector(self.priceFieldChanged(_:)), for: UIControl.Event.editingChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(storageDidSync), name: NSNotification.Name(rawValue: "synced"), object: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count == 0 {
            return true
          }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        if Float(prospectiveText) != nil {
            return true
        }
        if  Int(prospectiveText) != nil {
            return true
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    
    @objc func storageDidSync() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        GasStationLoader.shared.load()
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let numberOfRows = GasStationStorage.shared.gasStations.count
        return numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GasStationTableViewCell", for: indexPath) as! GasStationTableViewCell
        let data = GasStationStorage.shared.gasStations[indexPath.row]
        cell.nameField.text = data.name
        cell.priceField.text = String(data.price) + "$"
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(GasStationStorage.shared.gasStations[indexPath.row])
    }
}
