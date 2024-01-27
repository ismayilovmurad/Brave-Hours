//
//  ProfileView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 17.10.23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("accent").ignoresSafeArea()
            Text("Profile").foregroundStyle(.main)
        }
    }
}

#Preview {
    ProfileView()
}
