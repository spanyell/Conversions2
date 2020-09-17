//
//  TemperatureViewModel.swift
//  Conversions (iOS)
//
//  Created by Larry Burris on 9/16/20.
//
//  The view model takes the model as its variable and sets the value based on the business logic
//

import Foundation

class TemperatureViewModel : ObservableObject //  Conforms to the ObservableObject protocol which alerts the view when any variable with the @Published property wrapper changes, then the view is reloaded
{
    @Published var convertedTemperature = Temperature(temperature: 0.0)
    
    func convertTemperature(numberOfUnit: String, inputUnit: Double, outputUnit: Double)
    {
        let numberOfUnits = Double(numberOfUnit) ?? 0
        
        if inputUnit == 0 && outputUnit == 1
        {
            convertedTemperature.temperature = Double((numberOfUnits * 9/5) + 32)
        }
        else if inputUnit == 0 && outputUnit == 2
        {
            convertedTemperature.temperature = Double(numberOfUnits + 273.15)
        }
        else if inputUnit == 1 && outputUnit == 0
        {
            convertedTemperature.temperature = Double((numberOfUnits - 32) * 5/9)
        }
        else if inputUnit == 1 && outputUnit == 2
        {
            convertedTemperature.temperature = Double((numberOfUnits - 32) * 5/9 + 273.15)
        }
        else if inputUnit == 2 && outputUnit == 0
        {
            convertedTemperature.temperature = Double(numberOfUnits - 273.15)
        }
        else if inputUnit == 2 && outputUnit == 1
        {
            convertedTemperature.temperature = Double((numberOfUnits - 273.15) * 5/9 + 32)
        }
    }
}
