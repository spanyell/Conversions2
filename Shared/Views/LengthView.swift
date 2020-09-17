//
//  LengthView.swift
//  Conversions (iOS)
//
//  Created by Dan Beers on 9/16/20.
//

import SwiftUI

struct LengthView: View
{
    @ObservedObject var lengthViewModel : LengthViewModel
    
    @State private var numberOfUnit = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    var units = ["Inches", "Centimeters", "Miles", "Kilometers"]
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
                }
                
                Section(header: Text("Choose units:"))
                {
                    Picker("Select Unit", selection: $inputUnit)
                    {
                        ForEach(0 ..< units.count)
                        {
                            Text("\(self.units[$0])")
                        }
                    }.frame(width: nil, height: 33)
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                }
                
                Section(header: Text("Converting to:"))
                {
                    Picker("Select Unit", selection: $outputUnit)
                    {
                        ForEach(0 ..< units.count)
                        {
                            Text("\(self.units[$0])")
                        }
                    }.frame(width: nil, height: 33)
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                }
                
                Section(header: Text("The Answer is:"))
                {
                    Text(String(format: "%.2f", lengthViewModel.convertedLength.length) + " " + units[outputUnit])
                    
                }
                
                Section
                {
                    Button(action:
                            {
                                print("Button was clicked...")
                                
                                lengthViewModel.convertLength(numberOfUnit: numberOfUnit, inputUnit: inputUnit, outputUnit: outputUnit)
                                
                            },
                           label:
                            {
                                HStack()
                                {
                                    Spacer()
                                    Image(systemName: "ruler")
                                    Text("Convert Length")
                                    Spacer()
                                }
                            })
                        .cornerRadius(5)
                        .disabled(numberOfUnit == "" || inputUnit == outputUnit)
                }
            }.navigationBarTitle("Length Conversions")
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView(lengthViewModel: LengthViewModel())
    }
}
