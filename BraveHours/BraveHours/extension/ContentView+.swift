//
//  ContentView+.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 20.10.23.
//

import SwiftUI

extension ContentView {

    func CustomTabItem(iconName: String, isActive: Bool) -> some View {
        ZStack {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(isActive ? .accent : .accentDeactive)
        }
    }
}
