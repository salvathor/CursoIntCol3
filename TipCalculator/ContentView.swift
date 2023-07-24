//
//  ContentView.swift
//  TipCalculator
//
//  Created by Salvador Lopez on 24/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TipCalculatorModel()
    var body: some View {
        VStack {
            TextField("Enter bill amount", value: $viewModel.billAmount, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .padding()
            Slider(value: $viewModel.tipPercentage, in: 0...30, step: 5)
                .padding()
            Text("Tip percentage: \(Int(viewModel.tipPercentage))%")
                .font(.title3)
            Text("Tip amount: $\(viewModel.tipAmount, specifier: "%.2f")")
                .font(.title3)
            Text("Total amount: \(viewModel.totalAmount, specifier: "%.2f")")
                .font(.title2)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
