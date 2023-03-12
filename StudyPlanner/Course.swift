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
    var colour: Color
    
    var objectives: [Objective] = [] {
        didSet {
            for i in objectives {
                let index = objectives.firstIndex(of: i)
                objectives[index!].colour = colour
            }
        }
    }
    
    var start: Date
    var end: Date {
        var time = 0.0
        if objectives != [] {
            for i in objectives { time += i.duration }
        }
        
        return start.addingTimeInterval(time)
    }
}
