//
//  ObjectiveView.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 11/3/23.
//

import SwiftUI

struct ObjectiveView: View {
    
    var objective: Objective
    var colour: Color
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .foregroundColor(colour)
                    .frame(width: 8)
                
                Text(objective.title)
                    .font(.system(size: 20))
                    .bold()
            }
        }
        .frame(maxWidth: (UIScreen.main.bounds.width - 100))
        .padding(.top)
        .padding(.bottom)
    }
}

struct ObjectiveView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectiveView(objective: Objective(id: 0, title: "Learn Strings", description: ["Learn string interpolation", "Learn string manipulation"], colour: .blue, duration: 1.days.timeInterval), colour: Color.blue)
    }
}
