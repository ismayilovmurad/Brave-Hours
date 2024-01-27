//
//  ContentView.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 10.10.23.
//

import SwiftUI

struct ContentView: View {

    @State var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {

            TabView(selection: $selectedTab) {
                HomeView().tag(0)

                NewSessionView().tag(1)

                ProfileView().tag(2)
            }

            HStack {

                ForEach((TabbedItems.allCases), id: \.self) { item in

                    Button {
                        selectedTab = item.rawValue
                    } label: {
                        CustomTabItem(iconName: item.iconName, isActive: (selectedTab == item.rawValue))
                    }

                    if item.iconName != "person.circle.fill" {
                        Spacer()
                    }
                }

            }
            .padding(.horizontal, 48)
            .padding(.bottom, 12)
            .frame(maxWidth: .infinity, maxHeight: 86, alignment: .center)
            .background(Color(.main))
            .cornerRadius(30)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
