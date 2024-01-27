//
//  AppDelegate.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 17.10.23.
//

import Firebase
import FamilyControls
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Initialize the Firebase
        FirebaseApp.configure()
        
        // Request a Screen Time API permission
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        return true
    }
}
