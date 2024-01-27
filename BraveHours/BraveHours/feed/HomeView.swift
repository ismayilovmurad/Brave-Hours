//
//  HomeView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 17.10.23.
//

import SwiftUI
import SwiftData

struct HomeView: View {

    @Environment(\.modelContext) private var modelContext

    @Query private var sessions: [Session]

    @State var showDetailSheet = false
    
    @State var selectedItem: Session?
    
    

    var body: some View {
        NavigationStack {
            ZStack {
                Color("accent").ignoresSafeArea()

                        ScrollView {
                            ForEach(sessions) { session in
                                Button(action: {
                                    print(session.title)
                            
                                    selectedItem = Session(title: session.title, hour: session.hour, minute: session.minute)
                                   
                                }, label: {
                                    EmptyView()
                                })
                                .buttonStyle(StatableButton(change: { state in
                                    HStack {

                                        
                                        
                                        VStack(alignment: .leading) {
                                            Text("\(session.title)")
                                                .foregroundStyle(.accent)
                                                .font(.custom("ChalkboardSE-Bold", size: 20))
                                            
                                            Text("\(session.hour)h \(session.minute)m")
                                                .foregroundStyle(.accent3)
                                                .font(.custom("ChalkboardSE-Regular", size: 16))
                                        }
                                        .padding()
                                        
                                        Spacer()
                                        
                                        
                                    }
                                    .frame(height: 66)
                                    .frame(maxWidth: .infinity)
                                    
                                    .background(state ? Color(.accent2) : Color(.main2))
                                    .clipShape(.buttonBorder)
                                    
                                }))
                                .padding(.bottom)
                                
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(.top, 40)
                            .sheet(item: $selectedItem) { item in
                                    StartSessionView(session: item)
                                }
                        }
                        .padding(.horizontal)
                        .scrollIndicators(.hidden)
                        
            }
        }
        
    }
    

    
    private func deleteSession(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(sessions[index])
            }
        }
    }
}

#Preview {
    HomeView()
}
