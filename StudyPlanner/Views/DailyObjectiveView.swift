//
//  DailyObjectiveView.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 12/3/23.
//

import SwiftUI

struct DailyObjectiveView: View {
    
    @State var objectives: [Objective] = []
    @Binding var courses: [Course]
    
    var date: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(date.toFormat("dd MMMM yyyy"))
                .font(.system(size: 20))
                .bold()
            
            ForEach(objectives) { objective in
                ObjectiveView(objective: objective, colour: objective.colour)
            }
            .background {
                Rectangle()
                    .foregroundColor(Color("offWhite"))
                    .frame(maxWidth: UIScreen.main.bounds.width - 50)
                    .cornerRadius(10)
                
            }
        }
        .onAppear {
            for course in courses {
                objectives += getObjectivesForDate(date: date, course: course)
            }
        }
    }
    
    func getObjectivesForDate(date: Date, course: Course) -> [Objective] {
        var toReturn: [Objective] = []
        var date = course.start
        let objectives = course.objectives.sorted(by: {$0.id < $1.id})
        
        for i in 0 ..< objectives.count {
            if objectives[i].id != 0 {
                date = date.addingTimeInterval(objectives[i-1].duration)
            }
            if date.dateAtStartOf(.day) == self.date.dateAtStartOf(.day) {
                toReturn.append(objectives[i])
            }
        }
        return toReturn
    }
}

struct DailyObjectiveView_Previews: PreviewProvider {
    static var previews: some View {
        DailyObjectiveView(
            courses: .constant(
                [Course(
                    name: "C++",
                    colour: .blue,
                    objectives: [Objective(id: 0, title: "Learn Strings", description: ["Learn string interpolation", "Learn string manipulation"], colour: .blue, duration: 1.days.timeInterval)],
                    start: Date())]
            ), date: Date()
        )
    }
}
