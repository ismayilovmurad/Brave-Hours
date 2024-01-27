//
//  HomeView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 13.10.23.
//

import SwiftUI

struct ThirdView: View {
    
    @State var isExpanded = false
    @State var showtext = false
    
    @Binding var showNextView: Bool
    
    var body: some View {
        ZStack{
            CircleNextView(isExpanded: $isExpanded, showText: $showtext, color: "primary", text: "START", shouldToggleExpand: false)
            
            VStack(alignment: .leading){
                ContentView()
            }
            .opacity(isExpanded ? 1 : 0 )
            .scaleEffect(isExpanded ? 1 : 0)
            .offset(x: isExpanded ? 0 : UIScreen.main.bounds.width)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ThirdView(showNextView: .constant(false))
}
