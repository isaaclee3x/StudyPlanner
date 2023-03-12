//
//  CourseStorage.swift
//  StudyPlanner
//
//  Created by Isaac Lee Jing Zhi on 10/3/23.
//

import Foundation
import SwiftUI

class CourseStorage: ObservableObject {
    @Published var courses: [Course] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("courses.data")
    }
    
    static func load(completion: @escaping (Result<[Course], Error>) ->Void ) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                
                let courses = try JSONDecoder().decode([Course].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(courses))
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(courses: [Course], completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(courses)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(courses.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
