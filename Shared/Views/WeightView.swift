//
//  WeightView.swift
//  Conversions (iOS)
//
//  Created by Dan Beers on 9/18/20.
//

import SwiftUI

struct WeightView: View
{
    @ObservedObject var weightViewModel : WeightViewModel
    
    @State private var numberOfUnit = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    @State private var unitName = ""
    
    var units = ["Ounces", "Pounds", "Grams", "Kilograms"]
    
    func clearAnswer()
    {
        weightViewModel.convertedWeight.weight = ""
        unitName = ""
    }
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    TextField("Enter the number of units here:", text: $numberOfUnit)
                        .keyboardType(.decimalPad)
                        .onChange(of: numberOfUnit, perform: { value in
                            clearAnswer()
                        })
                }
                        
                Section(header: Text("Choose units:"))
                {
                    Picker("Select Unit", selection: $inputUnit)
                    {
                        ForEach(0 ..< units.count)
                        {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: inputUnit, perform: { value in
                        clearAnswer()
                    })
                    
                    
                }
                
                Section(header: Text("Converting to:"))
                {
                    Picker("Select Unit", selection: $outputUnit)
                    {
                        ForEach(0 ..< units.count)
                        {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: outputUnit, perform: { value in
                        clearAnswer()
                    })
                }
                
                Section(header: Text("The Answer is:"))
                {
                    Text(weightViewModel.convertedWeight.weight + unitName)
                }
                Section
                {
                    Button(action:
                    {
                        print("Button was clicked...")
                        weightViewModel.convertWeight(numberOfUnit: numberOfUnit, inputUnit: inputUnit, outputUnit: outputUnit)
                        unitName = " " + units[outputUnit]
                    },
                           label:
                            {
                                HStack()
                                {
                                    Spacer()
                                    Image(systemName: "scale")
                                    Text("Convert Weight")
                                    Spacer()
                                }
                            })
                        .cornerRadius(5)
                        .disabled(numberOfUnit == "" || inputUnit == outputUnit)
                }
            }.navigationBarTitle("Weight Conversions")
            .onAppear(perform: {
                clearAnswer()
                })
        }
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView(weightViewModel: WeightViewModel())
    }
}

