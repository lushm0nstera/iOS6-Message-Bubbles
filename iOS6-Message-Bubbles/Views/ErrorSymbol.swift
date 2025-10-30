//
//  ErrorSymbol.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/27/25.
//
import SwiftUI

struct ErrorSymbol: View {
    
    
    var body: some View {
        Circle()
            .fill(Color.iOS6Red)
            .stroke(.white, lineWidth: 2)
            .frame(width: 20)
            .overlay {
                Image(systemName: "exclamationmark")
                    .foregroundStyle(.white)
                    .font(.system(size: 12, weight: .bold))
            }
            .overlay {
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.white.opacity(0.5), .clear], startPoint: .top, endPoint: .bottom))
                    Ellipse()
                        .fill(.black)
                        .frame(width: 22)
                        .padding(.top, 8)
                        .blendMode(.destinationOut)
                    
                }.compositingGroup()
            }.shadow(color: .black.opacity(0.3), radius: 2, y: 2)
    }
}

#Preview {
    ErrorSymbol()
}
