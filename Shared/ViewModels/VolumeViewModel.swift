//
//  VolumeViewModel.swift
//  Conversions (iOS)
//
//  Created by Dan Beers on 9/18/20.
//

import Foundation

class VolumeViewModel : ObservableObject
{
    @Published var convertedVolume = Volume()
    
    func convertVolume(numberOfUnit: String, inputUnit: Int, outputUnit: Int)
    {
        let numberOfUnits = Double(numberOfUnit) ?? 0
        if inputUnit == 0 && outputUnit == 1
        {
            convertedVolume.volume = String(numberOfUnits / 16)
        }
        else if inputUnit == 0 && outputUnit == 2
        {
            convertedVolume.volume = String(numberOfUnits * 237)
        }
        else if inputUnit == 0 && outputUnit == 3
        {
            convertedVolume.volume = String(numberOfUnits / 4.227)
        }
        else if inputUnit == 1 && outputUnit == 0
        {
            convertedVolume.volume = String(numberOfUnits * 16)
        }
        else if inputUnit == 1 && outputUnit == 2
        {
            convertedVolume.volume = String(numberOfUnits * 3785)
        }
        else if inputUnit == 1 && outputUnit == 3
        {
            convertedVolume.volume = String(numberOfUnits * 3.785)
        }
        else if inputUnit == 2 && outputUnit == 0
        {
            convertedVolume.volume = String(numberOfUnits / 237)
        }
        else if inputUnit == 2 && outputUnit == 1
        {
            convertedVolume.volume = String(numberOfUnits / 3785)
        }
        else if inputUnit == 2 && outputUnit == 3
        {
            convertedVolume.volume = String(numberOfUnits / 1000)
        }
        else if inputUnit == 3 && outputUnit == 0
        {
            convertedVolume.volume = String(numberOfUnits * 4.227)
        }
        else if inputUnit == 3 && outputUnit == 1
        {
            convertedVolume.volume = String(numberOfUnits / 4.546)
        }
        else if inputUnit == 3 && outputUnit == 2
        {
            convertedVolume.volume = String(numberOfUnits * 1000)
        }
        print(convertedVolume.volume)
    }
}
