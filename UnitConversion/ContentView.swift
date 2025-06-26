//
//  ContentView.swift
//  UnitConversion
//
//  Created by Locus Wong on 2025-06-23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var inputUnit: String = "Celsius"
    @State private var outputUnit: String = "Fahrenheit"
    
    let unitArray: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedValue: Double {
        // First convert input to Celsius as base unit
        let celsiusValue: Double
        switch inputUnit {
        case "Celsius":
            celsiusValue = inputValue
        case "Fahrenheit":
            celsiusValue = (inputValue - 32.0) * 5.0 / 9.0
        case "Kelvin":
            celsiusValue = inputValue - 273.15
        default:
            celsiusValue = inputValue
        }
        
        // Then convert from Celsius to output unit
        switch outputUnit {
        case "Celsius":
            return celsiusValue
        case "Fahrenheit":
            return (celsiusValue * 9.0 / 5.0) + 32.0
        case "Kelvin":
            return celsiusValue + 273.15
        default:
            return celsiusValue
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(unitArray, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Temperature", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Output") {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(unitArray, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(convertedValue.formatted())
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

#Preview {
    ContentView()
}
