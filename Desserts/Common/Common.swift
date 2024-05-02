//
//  Common.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation
import SwiftUI
extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

extension Double {
    func round(num: Int) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = num
        formatter.roundingMode = .down
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
