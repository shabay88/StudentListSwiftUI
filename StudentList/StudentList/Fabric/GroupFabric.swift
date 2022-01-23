//
//  GroupFabric.swift
//  StudentList
//
//  Created by Роман Шабаев on 19.01.2022.
//

import Foundation


protocol GroupFabric {
    func makeRandomSection() -> StudentSection
}

class GroupGenerator: GroupFabric {

    private let nouns = ["Android", "C++", "Python", "Go", "Fullstack", "Software"]
    private let participles = ["junior", "middle", "senior", "teamlead", "architect"]

    private let studentFabric: StudentFabric

    init(studentFabric: StudentFabric) {
        self.studentFabric = studentFabric
    }

    func makeRandomSection() -> StudentSection {
        StudentSection(
            students: studentFabric.makeRandomStudentList(), title: makeRandomTitle()
        )
    }

    private func makeRandomTitle() -> String {
        [nouns.randomElement(), participles.randomElement()].compactMap({ $0 }).joined(separator: " ")
    }

}
