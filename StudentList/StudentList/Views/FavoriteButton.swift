//
//  FavoriteButton.swift
//  StudentList
//
//  Created by Роман Шабаев on 20.01.2022.
//

import SwiftUI

struct FavoriteButton: View {

    @Binding var isFavorite: Bool

    var body: some View {
        Button {
            withAnimation {
                isFavorite.toggle()
            }
        } label: {
            Label("Favorite", systemImage: isFavorite ? "star.fill" : "star")
                .foregroundColor(isFavorite ? .orange : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isFavorite: .constant(true))
    }
}
