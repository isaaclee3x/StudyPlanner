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
            Circle()
                .foregroundColor(colour)
                .frame(width: 15)
            
            Text(objective.title)
                .bold()
            
            Text("-  " + objective.description)
                .font(.system(size: 13))
            
        }
        .frame(maxWidth: (UIScreen.main.bounds.width - 10))
    }
}

struct ObjectiveView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectiveView(objective: .constant(Objective(id: 0, title: "Learn Strings", description: "Finish learning string manipulation", courseIn: "C++", duration: 1.days)), colour: Color.blue)
    }
}
