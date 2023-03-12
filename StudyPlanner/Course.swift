//
//  Course.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 9/3/23.
//

import Foundation
import SwiftUI

struct Course: Identifiable, Equatable, Codable {
    
    var id = UUID()
    
    var name: String
    var colour = Color.black
    
    var objectives: [Objective]
    
    var startOfCourse: Date 
    var endOfCourse: Date {
        var objectives = objectives
        var sorted: [Objective] = []
        
        if objectives != [] {
            sorted = objectives.sorted(by: {$0.end < $1.end})
        }
        
        return sorted.last!.end
    }
}
