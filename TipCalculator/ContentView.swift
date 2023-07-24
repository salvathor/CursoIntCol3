//
//  ContentView.swift
//  TipCalculator
//
//  Created by Salvador Lopez on 24/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var billAmount = 0
    @State var tipPercentage: Double = 5
    @State var tipAmount = 0
    @State var totalAmount = 0
    var body: some View {
        VStack {
            TextField("Enter bill amount", value: $billAmount, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .padding()
            Slider(value: $tipPercentage, in: 0...30, step: 5)
                .padding()
            Text("Tip percentage: \(Int(tipPercentage))%")
                .font(.title3)
            Text("Tip amount: $\(tipAmount, specifier: "%.2f")")
                .font(.title3)
            Text("Total amount: \(totalAmount, specifier: "%.2f")")
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
