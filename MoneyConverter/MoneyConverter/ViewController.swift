//
//  ViewController.swift
//  MoneyConverter
//
//  Created by 유지은 on 2020/03/29.
//  Copyright © 2020 jieun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencySegment: UISegmentedControl!
    
    @IBOutlet weak var sourceMoneyField: UITextField!
    
    @IBOutlet weak var targetMoneyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func convertMoney(_ sender: Any) {
        
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else{
            print("sourceCurrency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else{
            targetMoneyLabel.text = "Error!"
            return
        }
        
        let sourceMoney = Money(sourceAmount, currency:sourceCurrency)
        
        var targetMoneyString = ""
        
        for i in 0..<4{
            targetMoneyString += sourceMoney.valueInCurrency(currency: Currency(rawValue: i)!)
            targetMoneyString += "\r\n"
        }
        
        targetMoneyLabel.text = targetMoneyString
    }
}

