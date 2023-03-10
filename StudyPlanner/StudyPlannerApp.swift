//
//  StudyPlannerApp.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 9/3/23.
//

import SwiftUI

@main
struct StudyPlannerApp: App {
    
    @StateObject private var courseStore = CourseStorage()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    courseStore.load { result in
                        switch result {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let courses):
                            courseStore.courses = courses
                        }
                    }
                }
        }
    }
}
