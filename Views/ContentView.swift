//
//  ContentView.swift
//  Weather App
//
//  Created by Ahmed Dana Mohammed on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackGroundView(isNight: $isNight).animation(.easeInOut)

            VStack{
                cityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                
                HStack (spacing : 30){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 72)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temp: 88)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temp: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temp: 60)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temp: 25)

                    }
                    Spacer()
                Button{
                    isNight.toggle()
                    
                        
                } label: {
                    WeatherButton(title: "Change Day Time",
                    textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
            
        }
      
    }
    
   
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek : String
    var imageName : String
    var temp : Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium , design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40 )
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium ))
                .foregroundStyle(.white)
            
        }
    }
}

struct BackGroundView: View {
    @Binding var isNight : Bool
   
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
struct cityTextView: View {
    var cityName : String
    var body: some View {
       
        Text(cityName)
            .font(.system(size: 32, weight: .medium , design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}
struct MainWeatherView : View {
    var imageName : String
    var temp : Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180 , height: 180 )
               
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium ))
                .foregroundStyle(.white)

        } .padding(.bottom , 40)
    }
}

