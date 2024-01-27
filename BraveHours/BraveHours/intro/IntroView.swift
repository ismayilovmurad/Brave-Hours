//
//  ContentView_2.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 13.10.23.
//

import SwiftUI

struct IntroView: View {
    
    @State private var showSecondview = false
    @State private var showThirdview = false
    
    var body: some View {
        ZStack {
            Color("primary").ignoresSafeArea()
            
            Text("Ready to start having Brave Hours and get more things done daily?")
            .foregroundStyle(.main)
            .font(Font.custom("ChalkboardSE-Bold", size: 24))
            .padding()
            
            FirstView(showNextView: $showSecondview)
            
            SecondView(showNextView: $showThirdview)
                .modifier(ViewAnimation(isVisible: showSecondview))
            
            ThirdView(showNextView: $showThirdview)
                .modifier(ViewAnimation(isVisible: showThirdview))
        }
    }
}

#Preview {
    IntroView()
}
