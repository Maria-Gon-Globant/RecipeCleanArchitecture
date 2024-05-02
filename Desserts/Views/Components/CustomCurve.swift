//
//  CustomCurve.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import SwiftUI

struct CustomCurve: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {
            path in
            path.move(to: CGPoint(x: 0, y: 95))
            path.addLine(to: CGPoint(x: 0, y: -rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: -rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 95))
            
            let midX = rect.width / 2
            let width = rect.width
            
            let controlWidth = midX - 100
            
            path.move(to: CGPoint(x: 0, y: 95))
            
            let to = CGPoint(x: midX, y: 230)
            let control1 = CGPoint(x: controlWidth, y: 95)
            let control2 = CGPoint(x: controlWidth - 30 , y: 230)
            
            let to1 = CGPoint(x: width, y: 95)
            let control3 = CGPoint(x: width - (controlWidth - 30), y: 230)
            let control4 = CGPoint(x: width - controlWidth , y: 95)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}
