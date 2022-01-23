//
//  SectionModel.swift
//  StudentList
//
//  Created by Роман Шабаев on 19.01.2022.
//

import SwiftUI


struct StudentSection: Identifiable {
    let id = UUID()
    var students: [Student]
    var title: String
}

