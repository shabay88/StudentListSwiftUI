//
//  ViewModel.swift
//  StudentList
//
//  Created by Роман Шабаев on 14.01.2022.
//

import Foundation
import Combine
import SwiftUI

class ViewModel: ObservableObject {
    
    private let groupGenerator: GroupFabric = GroupGenerator(studentFabric: StudentGenerator())
    
    @Published var favoriteSections: [StudentSection] = []
    
    @Published var sections: [StudentSection] = [
        StudentSection(students: ViewModel.makeDefaultStudentList(), title: "iOS Developer")
    ]
    
    @Published var showFavoritesOnly = false
    
    private var bag = Set<AnyCancellable>()
    
    init() {
        configureFilteredSections()
    }
    
    private static func makeDefaultStudentList() -> [Student] {
        [
                Student(score: 3.0, name: "Roman", image: "bolt.fill", isFavorite: true),
                Student(score: 3.0, name: "Ivan", image: "leaf.circle.fill"),
                Student(score: 3.0, name: "Denis", image: "ant.fill"),
                Student(score: 3.0, name: "Pavel", image: "pawprint.fill")
            ]
    }
    
    func getIsFavoriteBinding(for student: Student) -> Binding<Bool> {
        Binding<Bool>(
            get: { student.isFavorite },
            set: { [weak self] isFavorite in
                guard let strongSelf = self else { return }
                if let studentIndex = strongSelf.sections.compactMap({ $0.students.firstIndex(where: { $0.id == student.id }) }).first,
                   let sectionIndex = strongSelf.sections.firstIndex(where: { $0.students.contains(where: { $0.id == student.id }) })
                {
                    strongSelf.sections[sectionIndex].students[studentIndex].isFavorite = isFavorite
                }
            }
        )
    }

    
    func addRandomSection() {
        sections.append(groupGenerator.makeRandomSection())
    }
    
    private func configureFilteredSections() {
        Publishers
            .CombineLatest($sections, $showFavoritesOnly)
            .map({ sections, showFavoritesOnly in
                guard showFavoritesOnly else { return sections }
                return sections
                    .map({ section in
                        StudentSection(students: section.students.filter({ student in student.isFavorite }), title: section.title)
                    })
                    .filter({ !$0.students.isEmpty })
            })
            .assign(to: \.favoriteSections, on: self)
            .store(in: &bag)

    }
}
