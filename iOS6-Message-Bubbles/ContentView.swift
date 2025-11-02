//
//  ContentView.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Spacer()
                MessageBubble("Hello", fromUser: true)
            }
            HStack {
                MessageBubble("Hi! This is a longer message. Can you show me what an empty message bubble looks like?", fromUser: false)
                Spacer()
            }
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    MessageBubble("Sure", fromUser: true)
                    MessageBubble("", fromUser: true)
                }
            }
            HStack {
                MessageBubble("Cool. What about a green bubble?", fromUser: false)
                Spacer()
            }
            HStack {
                Spacer()
                MessageBubble("\n\n\n\n.____________.", fromUser: true, messageType: .SMS, showStatus: true)
            }
            HStack {
                Spacer()
                MessageBubble("Boy it sure is great to live in 2012", fromUser: true, messageType: .SMS, status: .error)
            }
            
            HStack {
                MessageBubble(Image("default"), fromUser: false)
                Spacer()
            }
            
            HStack {
                Spacer()
                MessageBubble("So beautiful", fromUser: true, status: .delivered, showStatus: true)
            }
            
            HStack {
                iOS6TypingDots()
                Spacer()
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(18)
        .background(Color.iOS6MessageBackground)
    }
}

#Preview {
    VStack {
        ContentView()
//        XYSlider()
//            .background(Color.iOS6MessageBackground)
    }
    
}
