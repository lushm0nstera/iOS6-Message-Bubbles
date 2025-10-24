//
//  ContentView.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//

import SwiftUI

struct ContentView: View {
    
    let messages: [String] = ["Hello", "Hi! Can you show me what an empty message looks like?", "", "Cool. What about the green bubble?", "Uh oh, I think I lost cell service", "that's fine, it sure is great to live in 2012"]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                MessageBubble(content: "Hello", fromUser: true, isSMS: false)
            }
            HStack {
                MessageBubble(content: "Hi! This is a longer message. Can you show me what an empty message bubble looks like?", fromUser: false, isSMS: false)
                Spacer()
            }
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    MessageBubble(content: "Sure", fromUser: true, isSMS: false)
                    MessageBubble(content: "", fromUser: true, isSMS: false)
                }
            }
            HStack {
                MessageBubble(content: "Cool. What about a green bubble?", fromUser: false, isSMS: false)
                Spacer()
            }
            HStack {
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    MessageBubble(content: "\n\n\n\n.____________.", fromUser: true, isSMS: true)
                    Text("Sent as Text Message")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                }
            }
            HStack {
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    MessageBubble(content: "Boy it sure is great to live in 2012", fromUser: true, isSMS: true)
                    Text("Sent as Text Message")
                        .font(.caption)
                        .foregroundStyle(.secondary) 
                }
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
    ContentView()
}
