//
//  Color+Extensions.swift
//  RickAndMorty
//
//  Created by Nicolas Monzon on 16/2/2024.
//

import SwiftUI

struct HexColor {
    static func hex(_ hex: String, alpha: Double = 1.0) -> Color {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}

extension Color {
    
    static let backgroundColor = HexColor.hex("#F0F5F9")
    static let subtitleColor = HexColor.hex("#52616B")
    static let lightBackgroundColor = HexColor.hex("#C9D6DF")
    static let titleColor = HexColor.hex("#1E2022")
}
