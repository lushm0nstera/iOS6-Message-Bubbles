//
//  Extensions.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//
import SwiftUI

extension Color {
    
    static let systemGray5 = Color(uiColor: .systemGray5)
    
    static let iOS6MessageBackground = Color(red: 226/255, green: 232/255, blue: 241/255)
    
    static let iOS6Red = Color(red: 166/255, green: 28/255, blue: 43/255)
    
    static let iOS6DarkGray = Color(red: 0.78, green: 0.78, blue: 0.78)
    static let iOS6Gray = Color(red: 0.83, green: 0.83, blue: 0.83)
    static let iOS6LightGray = Color(red: 0.89, green: 0.89, blue: 0.89)
    
    static let iOS6DarkBlue = Color(red: 0.60, green: 0.77, blue: 0.98)
    static let iOS6Blue = Color(red: 0.73, green: 0.89, blue: 1.00)
    static let iOS6LightBlue = Color(red: 0.76, green: 0.93, blue: 1.00)
    
    static let iOS6DarkGreen = Color(red: 0.43, green: 0.68, blue: 0.43)
    static let iOS6Green = Color(red: 0.66, green: 0.85, blue: 0.40)
    static let iOS6LightGreen = Color(red: 0.86, green: 0.97, blue: 0.60)
    
    static var iOS6GrayGradient: LinearGradient {
        
        let stops = [
            Gradient.Stop(color: .iOS6DarkGray, location: 0),
            Gradient.Stop(color: .iOS6Gray, location: 0.2),
            Gradient.Stop(color: .iOS6LightGray, location: 0.85)
        ]
        
        return LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)
    }
    
    static var iOS6BlueGradient: LinearGradient {
        
        let stops = [
            Gradient.Stop(color: .iOS6DarkBlue, location: 0),
            Gradient.Stop(color: .iOS6Blue, location: 0.8),
            Gradient.Stop(color: .iOS6LightBlue, location: 0.95)
        ]
        
        return LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)
    }
    
    static var iOS6GreenGradient: LinearGradient {
        
        let stops = [
            Gradient.Stop(color: .iOS6DarkGreen, location: 0),
            Gradient.Stop(color: .iOS6Green, location: 0.8),
            Gradient.Stop(color: .iOS6LightGreen, location: 1)
        ]
        
        return LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)
    }
    
    static var iOS6TypingBubbleBackgroundGradient: LinearGradient {
        
        let stops = [
            Gradient.Stop(color: Color(red: 191/255, green: 199/255, blue: 214/255), location: 0),
            Gradient.Stop(color: Color(red: 208/255, green: 215/255, blue: 225/255), location: 0.6)
        ]
        
        return LinearGradient(stops: stops, startPoint: .top, endPoint: .bottom)
    }
    
    static var gemGradient = LinearGradient(colors: [.white, .white.opacity(0.2)], startPoint: .top, endPoint: .bottom)
}
