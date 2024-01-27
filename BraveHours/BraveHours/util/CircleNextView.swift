//
//  CircleNextView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 16.10.23.
//

import SwiftUI

struct CircleNextView: View {
    
    @Binding var isExpanded: Bool
    @Binding var showText: Bool
    
    var color: String
    var text: String = "NEXT"
    var showNextView: Binding<Bool>?
    var shouldToggleExpand: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color(color))
                    .frame(width: isExpanded ? max(geometry.size.width, geometry.size.height) * 1.5 : 200,
                           height: isExpanded ? max(geometry.size.width, geometry.size.height) * 1.5 : 200)
                
                if !isExpanded {
                    HStack {
                        Text(text)
                        Image(systemName: "arrow.right")
                    }
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .offset(x: isExpanded ? -250 : 40, y: isExpanded ? -150 : 20)
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.9, dampingFraction: 0.8)) {
                
                if shouldToggleExpand {
                    isExpanded.toggle()
                } else {
                    isExpanded = true
                }
                
                showText.toggle()
                
                if let showNextViewBinding = showNextView {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        showNextViewBinding.wrappedValue.toggle()
                    }
                }
            }
        }
    }
}
