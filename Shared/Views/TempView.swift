//
//  TempView.swift
//  Shared
//
//  Created by Dan Beers on 9/15/20.
//
import SwiftUI

struct TempView: View
{
    @ObservedObject var temperatureViewModel : TemperatureViewModel
    
    @State private var numberOfUnit = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    @State private var unitName = ""
    
    var units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    func clearAnswer()
    {
        temperatureViewModel.convertedTemperature.temperature = ""
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
                        .onAppear(perform: {unitName = ""})
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
                    Text(temperatureViewModel.convertedTemperature.temperature + unitName)
                    
                }
                    
                Section
                {
                    //  When clicked, this calls the convertTemperature function of the view model which updates the @Published
                    //  variable which updates the view
                    Button(action:
                    {
                        print("Button was clicked...")
                        
                        //  This is the line of code that keeps thowing the error.  There is nothing wrong with it that I can see...
                        temperatureViewModel.convertTemperature(numberOfUnit: numberOfUnit, inputUnit: inputUnit, outputUnit: outputUnit)
                        unitName = "°" + " " + units[outputUnit]
                    },
                    label:
                    {
                        HStack()
                        {
                            Spacer()
                            Image(systemName: "thermometer")
                            Text("Convert Temperature")
                            Spacer()
                        }
                    })
                    .cornerRadius(5)
                    .disabled(numberOfUnit == "" || inputUnit == outputUnit)

                }
                
            }.navigationBarTitle("Temp Conversions")
            .onAppear(perform: {
                clearAnswer()
            })
            
        }
    }
}


struct TempView_Previews: PreviewProvider
{
    static var previews: some View
    {
        TempView(temperatureViewModel: TemperatureViewModel())
    }
}
