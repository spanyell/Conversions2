//
//  LengthViewModel.swift
//  Conversions (iOS)
//
//  Created by Dan Beers on 9/16/20.
//

import Foundation

class LengthViewModel : ObservableObject
{
    @Published var convertedLength = Length()
    
    func convertLength(numberOfUnit: String, inputUnit: Int, outputUnit: Int)
    {
        let numberOfUnits = Double(numberOfUnit) ?? 0
        
        if inputUnit == 0 && outputUnit == 1
        {
            convertedLength.length = String(numberOfUnits * 2.54)
        }
        else if inputUnit == 0 && outputUnit == 2
        {
            convertedLength.length = String(numberOfUnits / 63360)
        }
        else if inputUnit == 0 && outputUnit == 3
        {
            convertedLength.length = String(numberOfUnits / 39370)
        }
        else if inputUnit == 1 && outputUnit == 0
        {
            convertedLength.length = String(numberOfUnits / 2.54)
        }
        else if inputUnit == 1 && outputUnit == 2
        {
            convertedLength.length = String(numberOfUnits / 160934)
        }
        else if inputUnit == 1 && outputUnit == 3
        {
            convertedLength.length = String(numberOfUnits / 100000)
        }
        else if inputUnit == 2 && outputUnit == 0
        {
            convertedLength.length = String(numberOfUnits * 63360)
        }
        else if inputUnit == 2 && outputUnit == 1
        {
            convertedLength.length = String(numberOfUnits * 160934)
        }
        else if inputUnit == 2 && outputUnit == 3
        {
            convertedLength.length = String(numberOfUnits * 1.609)
        }
        else if inputUnit == 3 && outputUnit == 0
        {
            convertedLength.length = String(numberOfUnits * 39370)
        }
        else if inputUnit == 3 && outputUnit == 1
        {
            convertedLength.length = String(numberOfUnits * 100000)
        }
        else if inputUnit == 3 && outputUnit == 2
        {
            convertedLength.length = String(numberOfUnits / 1.609)
        }
    }
}
