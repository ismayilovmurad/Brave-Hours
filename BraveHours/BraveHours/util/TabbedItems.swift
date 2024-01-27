//
//  TabbedItems.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 20.10.23.
//

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case history
    case profile
    
    var iconName: String{
        switch self {
        case .home:
            return "list.bullet.circle.fill"
        case .history:
            return "plus.circle.fill"
        case .profile:
            return "person.circle.fill"
        }
    }
}
