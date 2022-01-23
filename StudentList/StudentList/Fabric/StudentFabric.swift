//
//  StudentFabric.swift
//  StudentList
//
//  Created by Роман Шабаев on 19.01.2022.
//

import Foundation

protocol StudentFabric: AnyObject {
    func makeRandomStudentList() -> [Student]
}

class StudentGenerator: StudentFabric {
        private var names = ["Kirill","Mark","Vladimir","Andrew","Maksim","Igor","Petr", "Alexey", "Nikolay", "Mario", "Fedor", "Alexander"]
    
        private var images = ["bolt.fill", "leaf.circle.fill", "ant.fill", "pawprint.fill", "airtag.fill", "infinity.circle.fill"]
    
    func makeRandomStudentList() -> [Student] {
        var student = [Student]()
        let count = Int.random(in: 1...8)
        student.reserveCapacity(count)
        
        for _ in 0..<count {
            student.append(makeRandomStudent())
        }
        return student
    }
    
    func makeRandomStudent() -> Student {
        guard let name = names.randomElement(), let image = images.randomElement() else {
            return .example
        }
        let score = Float.random(in: 0...5)
        return Student(score: score, name: name, image: image)
    }
}
