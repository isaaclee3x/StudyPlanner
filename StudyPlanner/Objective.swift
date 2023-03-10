//
//  Objective.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 9/3/23.
//

import Foundation
import SwiftUI
import SwiftDate

class Objective: Identifiable, Equatable, Codable {
    static func == (lhs: Objective, rhs: Objective) -> Bool {
        return lhs.title == rhs.title && lhs.description == rhs.description && lhs.duration == rhs.duration
    }
    
    var id: Int
    
    init(title: String, description: String) {
        self.id = 0
        self.title = title
        self.description = description
        self.duration = 1.hours
    }
    
    var title: String
    var description: String
    
    var duration: DateComponents
}

