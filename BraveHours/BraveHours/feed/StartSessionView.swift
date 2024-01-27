//
//  StartSessionView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 29.10.23.
//

import SwiftUI

struct StartSessionView: View {
    
    @State var session: Session
    
    @StateObject private var startSessionViewModel = StartNewSessionViewModel()
    
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            Color("accent").ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                Image("do-magic")
                    .resizable()
                    .frame(width: 140, height: 140)
                
                VStack(spacing: 20) {
                    
                    TextField("",
                              text: $session.title,
                              prompt:
                                Text(sessionTitlePlaceholder).foregroundColor(.accent))
                    .font(.custom(appDefaultFont,
                                  size: appDefaultTextFieldSize))
                    .autocorrectionDisabled(true)
                    .padding()
                    .foregroundStyle(.accent)
                    .background(.main2)
                    .clipShape(.buttonBorder)
                    .disabled(true)
                    
                    Button(action: {
                        isPresented = true
                        
                    }, label: {
                        EmptyView()
                    })
                    .buttonStyle(StatableButton(change: { state in
                        
                        HStack {
                            
                            Image(systemName: "timer")
                            
                            HStack(spacing: 0) {
                                
                                
                                Text("\(session.hour)h \(session.minute)m")
                                    .foregroundStyle(.accent)
                                    .font(.custom(appDefaultFont, size: appDefaultTextFieldSize))
                                
                            }
                            
                            Spacer()
                        }
                        .font(.custom(appDefaultFont, size: appDefaultTextFieldSize))
                        .padding()
                        .foregroundStyle(.accent)
                        .background(state ? .main4 : .main3)
                        .clipShape(.buttonBorder)
                    }))
                    .familyActivityPicker(isPresented: $isPresented, selection: $startSessionViewModel.selectionToDiscourage)
                    
                }
                
                Button(action: {
                    startSessionViewModel.startMonitoring()
                }, label: {
                    EmptyView()
                })
                .buttonStyle(StatableButton(change: { state in
                    
                    HStack {
                        
                        Text(startButtonText)
                    }
                    .frame(maxWidth: .infinity)
                    .font(.custom(appDefaultFont, size: appDefaultButtonSize))
                    .padding()
                    .foregroundStyle(.accent)
                    .background(state ? .main2 : .main)
                    .clipShape(.buttonBorder)
                }))
                .padding(.horizontal, 40)
            }
            .padding(.horizontal)
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

#Preview {
    StartSessionView(session: Session(title: "Test", hour: 0, minute: 0))
}
