//
//  View+.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 23.10.23.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
