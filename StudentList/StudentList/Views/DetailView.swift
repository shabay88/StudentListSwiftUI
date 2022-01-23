//
//  DetailView.swift
//  StudentList
//
//  Created by Роман Шабаев on 14.01.2022.
//

import SwiftUI

struct DetailView: View {
    
    let student: Student
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack {
            Image(systemName: student.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text(student.name)
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack {
                Text("Score")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(String(format: "%0.1f", student.score))
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            Spacer()
            FavoriteButton(isFavorite: $isFavorite)
                .padding()
        }
        .padding(.top, 30)
        .navigationTitle("Student")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(student: .example, isFavorite: .constant(true))
    }
}
