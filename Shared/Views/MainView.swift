//
//  MainView.swift
//  Conversions (iOS)
//
//  Created by Dan Beers on 9/16/20.
//

import SwiftUI

struct MainView: View
{
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                NavigationLink(destination: LengthView(lengthViewModel: LengthViewModel()))
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        LinearGradient(gradient: Gradient(colors: [.purple, .orange]), startPoint: .leading, endPoint: .topTrailing)
                        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        Text("Length Conversions").bold()
                            .foregroundColor(Color.black)
                    }.padding()
                }
                NavigationLink(destination: TempView(temperatureViewModel: TemperatureViewModel()))
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .topTrailing)
                        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        Text("Temp Conversions").bold()
                            .foregroundColor(Color.black)
                    }.padding()
                }
                NavigationLink(destination: VolumeView(volumeViewModel: VolumeViewModel()))
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .bottom, endPoint: .top)
                        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        Text("Volume Conversions").bold()
                            .foregroundColor(Color.black)
                    }.padding()
                }
                NavigationLink(destination: PlaceholderView())
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]), center: .center)
                        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        Text("Weight Conversions").bold()
                            .foregroundColor(Color.black)
                    }.padding()
                }.navigationBarTitle("Conversions")
            
            }
        }
    }
}

struct PlaceholderView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This shit ain't done yet.")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//NavigationLink(destination: LengthView(lengthViewModel: LengthViewModel()))
