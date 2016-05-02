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
    
    func printPossibleTips() {
        print("15%: \(calculateTipWithTipPercentage(0.15))")
        print("18%: \(calculateTipWithTipPercentage(0.18))")
        print("20%: \(calculateTipWithTipPercentage(0.20))")
    }
}

let tipCalculator = TipCalculator(total: 33.25, taxPercentage: 0.06)
tipCalculator.printPossibleTips()