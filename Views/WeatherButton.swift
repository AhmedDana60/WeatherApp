//
//  WeatherButton.swift
//  Weather App
//
//  Created by Ahmed Dana Mohammed on 3/19/24.
//

import SwiftUI

struct WeatherButton : View {
    var title : String
    var textColor : Color
    var backgroundColor : Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20 , weight: .bold , design: .default))
            .cornerRadius(10)
    }
}

