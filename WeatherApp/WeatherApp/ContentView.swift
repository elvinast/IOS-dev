//
//  ContentView.swift
//  WeatherApp
//
//  Created by Эльвина on 18.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDarkMode = false
    
    var body: some View {
        ZStack { //puts everything on top of each other
            if isDarkMode{
                BackgroundView(topColor: .black, bottomColor: .gray) //making background
            }
            else{
                BackgroundView(topColor: .blue, bottomColor: Color("LightBlue")) //making background
            }
            VStack{
                Text("Cupertino, CA").font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding()
                if isDarkMode{
                    MainWeatherView(imgName: "moon.stars.fill", temp: 76)
                }
                else{
                    MainWeatherView(imgName: "cloud.sun.fill", temp: 76)
                }
//                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(weekDay: "TUE", imgName: "cloud.sun.fill", temp: 79)
                    WeatherDayView(weekDay: "WED", imgName: "sun.max.fill", temp: 74)
                    WeatherDayView(weekDay: "THU", imgName: "wind.snow", temp: 70)
                    WeatherDayView(weekDay: "FRI", imgName: "wind.snow", temp: 70)
                    WeatherDayView(weekDay: "SAT", imgName: "cloud.sun.fill", temp: 76)
                }
                Spacer() // to put it up
                
                Button{
//                    print("tapped")
                    isDarkMode.toggle()
                } label: {
                    if isDarkMode{
                        WeatherButton(title: "Change Night Time", txtColor: .blue, backColor: Color.white)
                    }
                    else{
                        WeatherButton(title: "Change Day Time", txtColor: .blue, backColor: Color.white)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View { //extract subview
    
    var weekDay: String
    var imgName: String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(weekDay).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white)
            Image(systemName: imgName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct MainWeatherView: View {
    
    var imgName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 8) { // for neg padding
            Image(systemName: imgName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180) // from sf symbols
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)//option+shift+8 for degree symbol
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    
    var title: String
    var txtColor: Color
    var backColor: Color
    
    var body: some View{
    Text(title)
        .frame(width: 280, height: 50)
        .background(backColor)
        .foregroundColor(txtColor)
        .font(.system(size: 20, weight: .bold, design: .default))
        .cornerRadius(10)
    }
}
