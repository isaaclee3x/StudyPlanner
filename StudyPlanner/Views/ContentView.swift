//
//  ContentView.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 9/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var courses = [
        Course(
            name: "C++",
            colour: .blue,
            objectives: [Objective(id: 0, title: "Strings", description: ["Learn Strings"], colour: .blue, duration: 1.days.timeInterval)],
            start: Date())]
    @State var date = Date()
            
    var body: some View {
        NavigationStack {
            DailyObjectiveView(courses: $courses, date: date)
        }
        .navigationTitle("Courses")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
