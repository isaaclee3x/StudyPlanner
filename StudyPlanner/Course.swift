//
//  Course.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 9/3/23.
//

import Foundation

struct Course: Identifiable, Equatable, Codable {
    
    var id = UUID()
    
    var name: String
    var colour = [0.0, 0.0, 0.0] {
        didSet {
            if colour.count > 3 {
                print("Error: colour cannot have more than the 3 rgb parameters")
                colour = oldValue
            }
        }
    }
    
    var objectives: [Objective]
    
    var startOfCourse: Date 
    var endOfCourse: Date {
        var date = startOfCourse
        if objectives == [] { print("Error: There are no objectives")}
        else {
            for i in objectives {
                date = date.addingTimeInterval(i.duration.timeInterval)
            }
        }
        
        return date
    }
}
