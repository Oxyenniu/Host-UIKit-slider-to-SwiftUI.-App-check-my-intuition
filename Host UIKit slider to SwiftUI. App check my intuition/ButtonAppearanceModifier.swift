//
//  ButtonAppearanceModifier.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 04.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ButtonAppearanceModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 120, height: 30)
            .background(color)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.black, lineWidth: 3)
            )
    }
}

extension View {
    func buttonAppearance(_ color: Color) -> some View {
        modifier(ButtonAppearanceModifier(color: color))
    }
}
