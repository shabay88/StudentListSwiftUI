//
//  RowView.swift
//  StudentList
//
//  Created by Роман Шабаев on 14.01.2022.
//

import SwiftUI

struct StudentRow: View {
    
    let student: Student
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: student.image)
                Text(student.name)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
                FavoriteButton(isFavorite: $isFavorite)
                    .labelStyle(.iconOnly)
                    .padding(.top, 20)
            }
            HStack(spacing: 5) {
                Text("Score: ")
                Text(String(format: "%0.1f", student.score))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        StudentRow(student: .example, isFavorite: .constant(true))
            .previewLayout(.fixed(width: 300, height: 60))
    }
}


