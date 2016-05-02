//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Ivo Stefanov on 5/2/16.
//  Copyright © 2016 DIV SOFT Ltd. All rights reserved.
//

class TipCalculatorModel {
    var total: Double
    var taxPercentage: Double
    var subtotal: Double {
        get {
            return total / (taxPercentage + 1)
        }
    }
    
    init(total: Double, taxPercentage: Double) {
        self.total = total
        self.taxPercentage = taxPercentage
    }
    
    func calculateTipWithTipPercentage(tipPercentage: Double) -> Double {
        return subtotal * tipPercentage;
    }
    
    func returnPossibleTips() -> [Int: Double]{
        let possibleTips = [0.15, 0.18, 0.20]
        var calculatedTips = [Int: Double]()
        
        for possibleTip in possibleTips {
            let percentage = Int(possibleTip * 100)
            calculatedTips[percentage] = calculateTipWithTipPercentage(possibleTip)
        }
        
        return calculatedTips
    }
}