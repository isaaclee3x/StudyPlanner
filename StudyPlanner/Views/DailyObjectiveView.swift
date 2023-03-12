//
//  DailyObjectiveView.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 12/3/23.
//

import SwiftUI

struct DailyObjectiveView: View {
    
    @Binding var courses: [Course]
    @Binding var date: Date
    
    var objectives: [Objective] {
        var toReturn: [Objective] = []
        for i in courses {
            toReturn += getObjectivesForDay(date: date, course: i)
        }
        return toReturn
    }
    
    var body: some View {
        VStack {
            ForEach(courses) { course in
                
            
            }
        }
    }
    
    func getObjectivesForDay(date: Date, course: Course) -> [Objective] {
        var objectives = course.objectives
        let map = objectives.filter { $0.start == date }
        return map
    }
}

struct DailyObjectiveView_Previews: PreviewProvider {
    static var previews: some View {
        DailyObjectiveView(
            courses: .constant(
                [Course(
                    name: "C++",
                    objectives: [Objective(id: 0, title: "Learn Strings", description: ["Learn string interpolation", "Learn string manipulation"], courseIn: "C++", start: Date(), end: Date().addingTimeInterval(1.days.timeInterval))],
                    startOfCourse: Date())]
            ), date: .constant(Date())
        )
    }
}
