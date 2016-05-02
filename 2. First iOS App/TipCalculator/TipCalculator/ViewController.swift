//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ivo Stefanov on 5/2/16.
//  Copyright © 2016 DIV SOFT Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // View Outlets
    @IBOutlet var totalTextField: UITextField!
    @IBOutlet var taxPercentageSlider: UISlider!
    @IBOutlet var taxPercentageLabel: UILabel!
    @IBOutlet var calculationsTextView: UITextView!
    
    // Dependencies
    let tipCalculator = TipCalculatorModel(total: 33.5, taxPercentage: 0.06)

    // Outlet methods
    @IBAction func calculateTapped(sender: AnyObject) {
        tipCalculator.total = Double(totalTextField.text!)!
        
        let possibleTips = tipCalculator.returnPossibleTips().sort() {$0.0 < $1.0}
        var calculations = ""
        
        for (tipPercentage, tipValue) in possibleTips {
            calculations += "\(tipPercentage)%: \(String(format:"%.2f", tipValue))\n"
        }
        
        calculationsTextView.text = calculations
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalculator.taxPercentage = Double(taxPercentageSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    // Other methods
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalculator.total)
        taxPercentageSlider.value = Float(tipCalculator.taxPercentage) * 100.0
        taxPercentageLabel.text = "Tax Percentage (\(Int(taxPercentageSlider.value))%)"
        calculationsTextView.text = ""
    }
    
    // Inherited methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

