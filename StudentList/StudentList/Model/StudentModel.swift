//
//  StudentModel.swift
//  StudentList
//
//  Created by Роман Шабаев on 14.01.2022.
//

import Foundation
import SwiftUI

struct Student: Identifiable {
    let id = UUID()
    var score: Float
    var name: String
    var image: String
    var isFavorite = false
}

extension Student {
    static var example: Student {
        Student(score: 3.0, name: "Roman", image: "bolt.fill")
    }
}


