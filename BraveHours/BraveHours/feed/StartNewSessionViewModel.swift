//
//  StartNewSessionViewModel.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 12.11.23.
//

import Foundation
import FamilyControls
import DeviceActivity
import ManagedSettings

class StartNewSessionViewModel: ObservableObject {
    
    static let shared = StartNewSessionViewModel()
    
    var selection: FamilyActivitySelection? = nil
    
    @Published var selectionCount = "Zero"
    
    @Published var time = TimeInterval()
    
    @Published var isQuickActive = true
    
    var dataToSave: Data? = nil
    
    var selectionToDiscourage = FamilyActivitySelection() {
        willSet {
            selection = newValue
                        
            print("__________________________")
            print("Selection: \(selection!)")
            print("__________________________")
            saveSelection()
            
            selectionCount = spellNumber()
        }
    }
    
    func spellNumber() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        let spelledOutNumber = formatter.string(for: selection?.applications.count ?? 0)!
        
        return spelledOutNumber.capitalized
    }
    
    func startMonitoring() {
        
        
        
        saveSelection()
        
        let calendar = Calendar.current
        
        let startHour = calendar.component(.hour, from: Date())
        let startMinute = calendar.component(.minute, from: Date())
        
        var endHour = calendar.component(.hour, from: Date())
        var endMinute = calendar.component(.minute, from: Date())
        
        let store = ManagedSettingsStore()
        
        if selection != nil {
            let applications = selection!.applicationTokens
            store.shield.applications = applications.isEmpty ? nil : applications
        }
        
        if endMinute > 59 {
            if endMinute == 60 {
                endHour += 1
                endMinute = 0
            } else {
                endHour += 1
                endMinute -= 60
            }
        }
        
        let intervalStart = DateComponents(hour: startHour, minute: startMinute)
        let intervalEnd = DateComponents(hour: endHour, minute: endMinute)
        
        let schedule = DeviceActivitySchedule(
            intervalStart: intervalStart,
            intervalEnd: intervalEnd,
            repeats: true)
        
        let center = DeviceActivityCenter()
        
        do {
            try center.startMonitoring(.activity, during: schedule)
        } catch {
            print ("Error: \(error)")
        }
    }
    
    func saveSelection() {
        let documentsDirectory = FileManager().containerURL(forSecurityApplicationGroupIdentifier: "group.com.muradismayilov.bravehours")
        
        let archiveURL = documentsDirectory?.appendingPathComponent("selection.plist")
        
        let encoder = JSONEncoder()
        
        if let dataToSave = try? encoder.encode(selection) {
            do {
                try dataToSave.write(to: archiveURL!)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getSelection() -> FamilyActivitySelection {
        let documentsDirectory = FileManager().containerURL(forSecurityApplicationGroupIdentifier: "group.com.muradismayilov.bravehours")
        
        guard let archiveURL = documentsDirectory?.appendingPathComponent("selection.plist") else { return FamilyActivitySelection() }
        
        guard let codeData = try? Data(contentsOf: archiveURL) else { return FamilyActivitySelection() }
        
        let decoder = JSONDecoder()
        
        let loadedSelection = (try? decoder.decode(FamilyActivitySelection.self, from: codeData)) ?? FamilyActivitySelection()
        
        return loadedSelection
    }
    
}

extension DeviceActivityName {
    static let activity = Self("activity")
}
