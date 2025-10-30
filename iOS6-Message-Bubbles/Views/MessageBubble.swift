//
//  MessageBubble.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//
import SwiftUI

struct MessageBubble: View {
    
    private enum ContentType {
        case text(String)
        case image(String)
    }
    
    enum MessageType {
        case iMessage
        case SMS
    }
    
    enum DeliveryStatus {
        case delivered
        case error
    }
    
    private let content: ContentType
    
    var fromUser: Bool
    var messageType: MessageType?
    var status: DeliveryStatus?
    var showStatus: Bool?
    
    
    // MARK: - Text Initializer
    init(_ text: String, fromUser: Bool, messageType: MessageType? = .iMessage, status: DeliveryStatus? = nil, showStatus: Bool? = false) {
        self.content = .text(text)
        self.fromUser = fromUser
        self.messageType = messageType
        self.status = status
        self.showStatus = showStatus
    }
    
    // MARK: - Image Initializer
    init(imageName: String, fromUser: Bool, messageType: MessageType? = .iMessage, status: DeliveryStatus? = nil, showStatus: Bool? = false) {
        self.content = .image(imageName)
        self.fromUser = fromUser
        self.messageType = messageType
        self.status = status
        self.showStatus = showStatus
    }
    
    private var backgroundColor: AnyShapeStyle {
        
        switch fromUser {
            
        case true:
            switch messageType {
            case .SMS:
                return AnyShapeStyle(Color.iOS6GreenGradient)
            default:
                return AnyShapeStyle(Color.iOS6BlueGradient)
            }
            
        case false:
            return AnyShapeStyle(Color.iOS6GrayGradient)
        }
    }
    
    var body: some View {
        
        VStack(alignment: fromUser ? .trailing : .leading, spacing: 8) {
            
            HStack(spacing: 20) {
                
                switch content {
                case .text(let text):
                    ZStack(alignment: .top) {
                        Text(.init(text))
                            .textSelection(.enabled)
                            .font(.system(size: 14))
                            .padding(8)
                            .foregroundStyle(.black)
                            .fontWeight(.medium)
                            .frame(minWidth: 32, minHeight: 32)
     
                    }
                    .background(
                        BubbleShape(tail: fromUser ? .trailing : .leading)
                            .fill(backgroundColor)
                            .shadow(color: .black.opacity(0.3), radius: 2, y: 2)
                    )
                    .overlay(alignment: .top) {
                        ZStack(alignment: .top) {
                            Capsule()
                                .fill(Color .gemGradient)
                                .padding([.leading, .trailing], 8)
                                .frame(height: 15)
                                .blendMode(.overlay)
                            BubbleShape(tail: fromUser ? .trailing : .leading)
                                .strokeBorder(backgroundColor, lineWidth: 1.5)
                                .blendMode(.hardLight)
                            BubbleShape(tail: fromUser ? .trailing : .leading)
                                .stroke(.black.opacity(0.65), lineWidth: 1)
                        }
                    }.frame(maxWidth: 300, alignment: fromUser ? .trailing : .leading)
                
                    
                case .image(let imageName):
                    Image(imageName)
                        .resizable()
                        .scaleEffect(1.2)
                        .frame(maxWidth: 135, maxHeight: 150)
                        .clipShape(BubbleShape(tail: fromUser ? .trailing : .leading))
                        .background(
                            BubbleShape(tail: fromUser ? .trailing : .leading)
                                .fill(Color.clear)
                                
                        )
                        .shadow(color: .black.opacity(0.3), radius: 2, y: 2)
                        .overlay(alignment: .top) {
                            ZStack(alignment: .top) {
                                Capsule()
                                    .fill(Color .gemGradient)
                                    .padding([.leading, .trailing], 8)
                                    .frame(height: 15)
                                    .blendMode(.overlay)
                                BubbleShape(tail: fromUser ? .trailing : .leading)
                                    .stroke(.black.opacity(0.65), lineWidth: 1)
                            }
                        }.frame(maxWidth: 300, alignment: fromUser ? .trailing : .leading)
                
                      
                }

                if (status == .error) {
                    ErrorSymbol()
                }
                
            }
            
            if (showStatus ?? false) {
                if messageType == .SMS {
                    Text("Sent as Text Message")
                        .font(.system(size: 12, weight: .semibold))
                        .highlight()
                        .foregroundStyle(.gray)
                }
                
                if messageType == .iMessage {
                    Text("Delivered")
                        .font(.system(size: 12, weight: .semibold))
                        .highlight()
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

extension Shape {
    func reversed() -> AnyView {
        return AnyView(self.scaleEffect(x: -1))
    }
}

//
//if let imageName = imageName {
//    Image(imageName)
//        .resizable()
//        .frame(maxWidth: 135, maxHeight: 150)
//       
//}
