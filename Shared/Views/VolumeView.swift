//
//  VolumeView.swift
//  Conversions (iOS)
//
//  Created by Dan Beers on 9/18/20.
//

import SwiftUI

struct VolumeView: View
{
    @ObservedObject var volumeViewModel : VolumeViewModel
    
    @State private var numberOfUnit = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    @State private var unitName = ""
    
    var units = ["Cups", "Gallons", "Milliliters", "Liters"]
    
    func clearAnswer()
    {
        volumeViewModel.convertedVolume.volume = ""
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
                    Text(volumeViewModel.convertedVolume.volume + unitName)
                }
                Section
                {
                    Button(action:
                    {
                        print("Button was clicked...")
                        volumeViewModel.convertVolume(numberOfUnit: numberOfUnit, inputUnit: inputUnit, outputUnit: outputUnit)
                        unitName = " " + units[outputUnit]
                    },
                           label:
                            {
                                HStack()
                                {
                                    Spacer()
                                    Image(systemName: "beaker")
                                    Text("Convert Volume")
                                    Spacer()
                                }
                            })
                        .cornerRadius(5)
                        .disabled(numberOfUnit == "" || inputUnit == outputUnit)
                }
            }.navigationBarTitle("Volume Conversions")
            .onAppear(perform: {
                clearAnswer()
                })
        }
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView(volumeViewModel: VolumeViewModel())
    }
}
