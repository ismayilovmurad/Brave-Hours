//
//  ViewAnimation.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 16.10.23.
//

import SwiftUI

struct ViewAnimation: ViewModifier {
    
    var isVisible: Bool
    
    func body(content: Content) -> some View {
        content
            .offset(x: isVisible ? 0 : 200)
            .scaleEffect(isVisible ? 1 : 0, anchor: .bottomTrailing)
            .animation(.spring(), value: isVisible)
    }
}
