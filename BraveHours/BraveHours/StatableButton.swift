//
//  StatableButton.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 18.10.23.
//

import SwiftUI

struct StatableButton<Content>: ButtonStyle where Content: View {
    var change: (Bool) -> Content
    
    func makeBody(configuration: Configuration) -> some View {
        return change(configuration.isPressed)
    }
}
