//
//  TypingDots.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//
import SwiftUI

struct iOS6TypingDots: View {
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...3, id:\.self) { _ in
                Circle()
                    .fill(LinearGradient(stops: [
                        Gradient.Stop(color: .white, location: 0),
                        Gradient.Stop(color: Color.iOS6MessageBackground, location: 0.4)] , startPoint: .top, endPoint: .bottom))
                    .stroke(Color(red: 149/255, green: 157/255, blue: 173/255))
                    .shadow(color: .black.opacity(0.1), radius: 2)
                    .frame(height: 10)
            }
        }.padding(12)
        .background(
            Capsule()
                .fill(Color.iOS6TypingBubbleBackgroundGradient)
//                .stroke(.white.gradient.opacity(0.4), lineWidth: 2)
                .strokeBorder(Color(red: 149/255, green: 157/255, blue: 173/255).gradient.opacity(0.6), lineWidth: 1)
        )
    }
}
