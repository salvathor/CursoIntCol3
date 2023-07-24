//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Salvador Lopez on 24/07/23.
//

import Foundation

class TipCalculatorModel: ObservableObject {
    
    @Published var billAmount: Double = 0
    @Published var tipPercentage: Double = 15
    
    var tipAmount: Double {
        return billAmount * tipPercentage / 100
    }
    
    var totalAmount: Double {
        return billAmount + tipAmount
    }
    
}
