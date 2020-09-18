//
//  WeightViewModel.swift
//  Conversions (iOS)
//
//  Created by Dan Beers on 9/18/20.
//

import Foundation

class WeightViewModel : ObservableObject
{
    @Published var convertedWeight = Weight()
    
    func convertWeight(numberOfUnit: String, inputUnit: Int, outputUnit: Int)
    {
        let numberOfUnits = Double(numberOfUnit) ?? 0
        
        if inputUnit == 0 && outputUnit == 1
        {
            convertedWeight.weight = String(numberOfUnits / 16)
        }
        else if inputUnit == 0 && outputUnit == 2
        {
            convertedWeight.weight = String(numberOfUnits * 28.35)
        }
        else if inputUnit == 0 && outputUnit == 3
        {
            convertedWeight.weight = String(numberOfUnits / 35.274)
        }
        else if inputUnit == 1 && outputUnit == 0
        {
            convertedWeight.weight = String(numberOfUnits * 16)
        }
        else if inputUnit == 1 && outputUnit == 2
        {
            convertedWeight.weight = String(numberOfUnits * 454)
        }
        else if inputUnit == 1 && outputUnit == 3
        {
            convertedWeight.weight = String(numberOfUnits * 2.205)
        }
        else if inputUnit == 2 && outputUnit == 0
        {
            convertedWeight.weight = String(numberOfUnits / 28.35)
        }
        else if inputUnit == 2 && outputUnit == 1
        {
            convertedWeight.weight = String(numberOfUnits / 454)
        }
        else if inputUnit == 2 && outputUnit == 3
        {
            convertedWeight.weight = String(numberOfUnits / 1000)
        }
        else if inputUnit == 3 && outputUnit == 0
        {
            convertedWeight.weight = String(numberOfUnits * 35.274)
        }
        else if inputUnit == 3 && outputUnit == 1
        {
            convertedWeight.weight = String(numberOfUnits / 2.205)
        }
        else if inputUnit == 3 && outputUnit == 2
        {
            convertedWeight.weight = String(numberOfUnits / 1000)
        }
    }
}
