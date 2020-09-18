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
    @State private var outputUnit = 1
    @State private var unitName = ""
    
    var units = ["Inches", "Centimeters", "Miles", "Kilometers"]
    
    func clearAnswer()
    {
        lengthViewModel.convertedLength.length = ""
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
                        .onChange(of: numberOfUnit, perform: {value in
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
                    }.frame(width: nil, height: 33)
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
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
                    }.frame(width: nil, height: 33)
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    .onChange(of: outputUnit, perform: { value in
                        clearAnswer()
                    })
                }
                
                Section(header: Text("The Answer is:"))
                {
                    Text(lengthViewModel.convertedLength.length + unitName)
                    
                }
                
                Section
                {
                    Button(action:
                            {
                                print("Button was clicked...")
                                
                                lengthViewModel.convertLength(numberOfUnit: numberOfUnit, inputUnit: inputUnit, outputUnit: outputUnit)
                                unitName = " " + units[outputUnit]
                                
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
            }
            .navigationBarTitle("Length Conversions")
            .onAppear(perform: {
                clearAnswer()
            })
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView(lengthViewModel: LengthViewModel())
    }
}
