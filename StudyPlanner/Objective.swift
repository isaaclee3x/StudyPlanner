//
//  Objective.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 9/3/23.
//

import Foundation
import SwiftUI
import SwiftDate

struct Objective: Identifiable, Equatable, Codable {
    
    var id: Int
    
    var title: String
    var description: String
    var courseIn: String //make sure when they add objectives to this course, the courseIn becomes the name of the course
    var duration: DateComponents
}

