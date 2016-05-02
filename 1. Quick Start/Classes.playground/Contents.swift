class TipCalculator {
    let total: Double
    let taxPercentage: Double
    let subtotal: Double
    
    init(total: Double, taxPercentage: Double) {
        self.total = total
        self.taxPercentage = taxPercentage
        subtotal = total / (taxPercentage + 1)
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

let tipCalculator = TipCalculator(total: 33.25, taxPercentage: 0.06)
tipCalculator.returnPossibleTips()