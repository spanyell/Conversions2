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
                        LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .leading, endPoint: .topTrailing)
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
                        LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .leading, endPoint: .topTrailing)
                        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        Text("Temperature Conversions").bold()
                            .foregroundColor(Color.black)
                    }.padding()
                }
                NavigationLink(destination: VolumeView(volumeViewModel: VolumeViewModel()))
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top)
                        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        Text("Volume Conversions").bold()
                            .foregroundColor(Color.black)
                    }.padding()
                }
                NavigationLink(destination: WeightView(weightViewModel: WeightViewModel()))
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)
                        RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                        Text("Weight Conversions").bold()
                            .foregroundColor(Color.black)
                    }.padding()
                }.navigationBarTitle("Conversions")
            }.background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
        }
    }
}

//struct PlaceholderView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("This shit ain't done yet.")
//            }
//        }
//    }
//}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//NavigationLink(destination: LengthView(lengthViewModel: LengthViewModel()))
