//
//  NewSessionViewModel.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 22.10.23.
//

import Foundation
import SwiftData

@MainActor
final class NewSessionViewModel: ObservableObject {
    @Published var title = ""
    @Published var duration = TimeInterval() 
    
    func createNewSession(modelContext: ModelContext) {
        let newSession = Session(title: title, hour: duration.hour, minute: duration.minute)
        modelContext.insert(newSession)
    }
}
