//
//  HistoryView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 17.10.23.
//

import SwiftUI

struct NewSessionView: View {

    @StateObject private var newSessionViewModel = NewSessionViewModel()
    
    @State var showDurationPickerSheet = false
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ZStack {
            Color("accent").ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                Image("new-ideas-in-process")
                    .resizable()
                    .frame(width: 140, height: 140)
                
                VStack(spacing: 20) {
                    
                    TextField("",
                              text: $newSessionViewModel.title,
                              prompt:
                                Text(sessionTitlePlaceholder).foregroundColor(.accent))
                    .font(.custom(appDefaultFont,
                                  size: appDefaultTextFieldSize))
                    .autocorrectionDisabled(true)
                    .padding()
                    .foregroundStyle(.accent)
                    .background(.main2)
                    .clipShape(.buttonBorder)
                    .submitLabel(.done)
                    
                    Button(action: {
                        self.hideKeyboard()
                        showDurationPickerSheet.toggle()
                        
                    }, label: {
                        EmptyView()
                    })
                    .buttonStyle(StatableButton(change: { state in
                        
                        HStack {
                            
                            Image(systemName: "timer")
                            
                            HStack(spacing: 0) {
                                
                                
                                Text(newSessionViewModel.duration.hour > 9 ? "\(newSessionViewModel.duration.hour)" : "0\(newSessionViewModel.duration.hour)")
                                
                                Text(":")
                                
                                Text(newSessionViewModel.duration.minute > 9 ? "\(newSessionViewModel.duration.minute)" : "0\(newSessionViewModel.duration.minute)")
                            }
                            
                            Spacer()
                        }
                        .font(.custom(appDefaultFont, size: appDefaultTextFieldSize))
                        .padding()
                        .foregroundStyle(.accent)
                        .background(state ? .main4 : .main3)
                        .clipShape(.buttonBorder)
                    }))
                    .sheet(isPresented: $showDurationPickerSheet, content: {
                        DurationPicker(duration: $newSessionViewModel.duration)
                            .presentationDetents([.height(durationPickerHeight)])
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.accent)
                    })
                }
                
                Button(action: {
                    newSessionViewModel.createNewSession(modelContext: modelContext)
                }, label: {
                    EmptyView()
                })
                .buttonStyle(StatableButton(change: { state in
                    
                    HStack {
                        
                        Text(createButtonText)
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
    NewSessionView()
}
