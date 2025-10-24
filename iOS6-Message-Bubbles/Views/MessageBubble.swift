//
//  MessageBubble.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//
import SwiftUI

struct MessageBubble: View {
    
    var content: String
    var fromUser: Bool
    var isSMS: Bool
    
    private var backgroundColor: AnyShapeStyle {
        
        switch fromUser {
            
        case true:
            switch isSMS {
            case true:
                return AnyShapeStyle(Color.iOS6GreenGradient)
            default:
                return AnyShapeStyle(Color.iOS6BlueGradient)
            }
            
        case false:
            return AnyShapeStyle(Color.iOS6GrayGradient)
        }
    }
    
    var body: some View {
        
        ZStack {
            Text(content)
                .textSelection(.enabled)
                .font(.system(size: 16))
                .padding(8)
                .foregroundStyle(.black)
                .fontWeight(.medium)
                .frame(minWidth: 32)
        }.background(
            BubbleShape()
                .fill(backgroundColor)
                .shadow(color: .black.opacity(0.3), radius: 4, y: 2)
                .scaleEffect(x: fromUser ? 1 : -1, y: 1)
        )
        .overlay(alignment: .top) {
            ZStack(alignment: .top) {
                Capsule()
                    .fill(Color .gemGradient)
                    .padding([.leading, .trailing], 8)
                    .frame(height: 15)
                BubbleShape()
                    .strokeBorder(backgroundColor, lineWidth: 1.5)
                    .blendMode(.hardLight)
                    .scaleEffect(x: fromUser ? 1 : -1, y: 1)
                BubbleShape()
                    .stroke(.black.opacity(0.65), lineWidth: 1)
                    .scaleEffect(x: fromUser ? 1 : -1, y: 1)
            }
        }
        .frame(maxWidth: 300, alignment: fromUser ? .trailing : .leading)
    }
}
