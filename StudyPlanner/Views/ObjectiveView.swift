//
//  ObjectiveView.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 11/3/23.
//

import SwiftUI

struct ObjectiveView: View {
    
    @Binding var objective: Objective
    var colour: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .foregroundColor(colour)
                    .frame(width: 8)
                
                Text(objective.title)
                    .bold()
            }
            
            
            ForEach(objective.description, id: \.self) { description in
                Text("-  " + description)
                    .font(.system(size: 13))
                    .frame(height: 10)
                    
            }
        }
        .frame(maxWidth: (UIScreen.main.bounds.width - 100))
    }
}

struct ObjectiveView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectiveView(objective: .constant(Objective(id: 0, title: "Learn Strings", description: ["Learn string interpolation", "Learn string manipulation"], courseIn: "C++", start: Date(), end: Date().addingTimeInterval(1.days.timeInterval))), colour: Color.blue)
    }
}
