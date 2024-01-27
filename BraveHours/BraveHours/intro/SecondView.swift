//
//  SecondView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 13.10.23.
//

import SwiftUI

struct SecondView: View {
    
    @State var isExpanded = false
    @State var showText = false
    
    @Binding var showNextView: Bool
    
    var body: some View {
        ZStack {
            CircleNextView(isExpanded: $isExpanded, showText: $showText, color: "secondary", showNextView: $showNextView)
            
            VStack(alignment: .leading) {
                Text("Ready to start having Brave Hours and get more things done daily?")
                .foregroundStyle(.main2)
                .font(Font.custom("ChalkboardSE-Bold", size: 24))
                .padding()
            }
            .opacity(isExpanded ? 1 : 0)
            .scaleEffect(isExpanded ? 1 : 0)
            .offset(x: showText ? 0 : UIScreen.main.bounds.width)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SecondView(showNextView: .constant(false))
}
