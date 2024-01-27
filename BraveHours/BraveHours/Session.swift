//
//  Session.swift
//  BraveHours
//
//  Created by Murad Ismayilov on 18.10.23.
//

import Foundation
import SwiftData

@Model
final class Session {
    var title = "Job Search"
    var hour = 0
    var minute = 15

    init(title: String, hour: Int, minute: Int) {
        self.title = title
        self.hour = hour
        self.minute = minute
    }
}
