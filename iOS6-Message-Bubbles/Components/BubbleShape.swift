//
//  BubbleShape.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//
import SwiftUI

struct BubbleShape: InsettableShape {
    
    enum TailPosition {
        case leading, trailing
    }
    
    private var cornerRadius: CGFloat = 16.0
    var tail: TailPosition? = .trailing
    
    init(tail: TailPosition? = .trailing) {
        self.tail = tail
    }
    
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            
            let insettableRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
            
            let r = cornerRadius
            
            let minX = insettableRect.minX
            let minY = insettableRect.minY
            let midY = insettableRect.midY
            let maxX = insettableRect.maxX
            let maxY = insettableRect.maxY
            
            let middleLeading = CGPoint(x: minX, y: midY)
            
            switch tail {
            case .leading:
                path.move(to: middleLeading)
                
                //top tail arc
                path.addArc(center: CGPoint(x: minX - r, y: maxY - (r * 0.9)),
                            radius: r,
                            startAngle: .degrees(0),
                            endAngle: .degrees(60),
                            clockwise: false)
                
                //bottom tail arc
                path.addArc(center: CGPoint(x: minX - r / 2, y: maxY - r),
                            radius: r,
                            startAngle: .degrees(90),
                            endAngle: .degrees(41),
                            clockwise: true)
                
                //bottom tail connector
                path.addArc(center: CGPoint(x: minX + r, y: maxY - r),
                                    radius: r,
                                    startAngle: .degrees(135),
                                    endAngle: .degrees(90),
                                    clockwise: true)
                
                //bottom right
                path.addArc(center: CGPoint(x: maxX - r, y: maxY - r),
                                    radius: r,
                                    startAngle: .degrees(90),
                                    endAngle: .degrees(0),
                                    clockwise: true)
                
                //top right
                path.addArc(center: CGPoint(x: maxX - r, y: minY + r),
                                    radius: r,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(-90),
                                    clockwise: true)
                
                //top left
                path.addArc(center: CGPoint(x: minX + r, y: minY + r),
                                    radius: r,
                                    startAngle: .degrees(270),
                                    endAngle: .degrees(180),
                                    clockwise: true)
                path.closeSubpath()
                
            default:
                path.move(to: middleLeading)
                //top left
                path.addArc(center: CGPoint(x: minX + r, y: minY + r),
                                    radius: r,
                                    startAngle: .degrees(180),
                                    endAngle: .degrees(270),
                                    clockwise: false)
                //top right
                path.addArc(center: CGPoint(x: maxX - r, y: minY + r),
                                    radius: r,
                                    startAngle: .degrees(-90),
                                    endAngle: .degrees(0),
                                    clockwise: false)
                
                
                //top tail arc
                path.addArc(center: CGPoint(x: maxX + r, y: maxY - (r * 0.9)),
                            radius: r,
                            startAngle: .degrees(180),
                            endAngle: .degrees(120),
                            clockwise: true)
                
                //bottom tail arc
                path.addArc(center: CGPoint(x: maxX + r / 2, y: maxY - r),
                            radius: r,
                            startAngle: .degrees(90),
                            endAngle: .degrees(139),
                            clockwise: false)
                
                //bottom tail connector
                path.addArc(center: CGPoint(x: maxX - r, y: maxY - r),
                                    radius: r,
                                    startAngle: .degrees(45),
                                    endAngle: .degrees(90),
                                    clockwise: false)
                //bottom left
                path.addArc(center: CGPoint(x: minX + r, y: maxY - r),
                                    radius: r,
                                    startAngle: .degrees(90),
                                    endAngle: .degrees(180),
                                    clockwise: false)
                path.closeSubpath()
            }
            
            
            
        }
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var copy = self
        copy.insetAmount += amount
        return copy
    }
}

#Preview {
    BubbleShape(tail: .trailing)
        .stroke(.black)
        .frame(maxWidth: 150, maxHeight: 75)
        .padding()
    BubbleShape(tail: .leading)
        .stroke(.black)
        .frame(maxWidth: 150, maxHeight: 75)
        .padding()
}
