//
//  BubbleShape.swift
//  iOS6-Message-Bubbles
//
//  Created by Andrew Janson on 10/24/25.
//
import SwiftUI

struct BubbleShape: InsettableShape {
    
    var cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat = 16.0) {
        self.cornerRadius = cornerRadius
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
            
            path.move(to: middleLeading)
            path.addArc(center: CGPoint(x: minX + r, y: minY + r),
                                radius: r,
                                startAngle: .degrees(180),
                                endAngle: .degrees(270),
                                clockwise: false)
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
            
            
            path.addArc(center: CGPoint(x: maxX - r, y: maxY - r),
                                radius: r,
                                startAngle: .degrees(45),
                                endAngle: .degrees(90),
                                clockwise: false)
            path.addArc(center: CGPoint(x: minX + r, y: maxY - r),
                                radius: r,
                                startAngle: .degrees(90),
                                endAngle: .degrees(180),
                                clockwise: false)
            path.closeSubpath()
            
        }
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var copy = self
        copy.insetAmount += amount
        return copy
    }
}
