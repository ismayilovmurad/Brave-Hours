//
//  FirstView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 13.10.23.
//

import SwiftUI

struct FirstView: View {
    
    @State var isExpanded = false
    @State var showText = false
    
    @Binding var showNextView: Bool
    
    var body: some View {
        ZStack {            
            CircleNextView(isExpanded: $isExpanded, showText: $showText, color: "primary", showNextView: $showNextView)
            
            VStack(alignment: .leading) {
                Text("Don't waste time and urs effective . This app lets you focus during working, learning, doing workout, etc. Instead of scheduling your days by time")
                .foregroundStyle(.accent2)
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
    FirstView(showNextView: .constant(false))
}
