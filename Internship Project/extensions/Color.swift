//
//  Color.swift
//  Internship Project
//
//  Created by Zeynep Baran on 22.08.2024.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xff0000) >> 16) / 255
        let g = Double((rgbValue & 0x00ff00) >> 8) / 255
        let b = Double(rgbValue & 0x0000ff) / 255
        self.init(red: r, green: g, blue: b)
    }
}

