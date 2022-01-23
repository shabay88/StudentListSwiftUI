//
//  StudentView.swift
//  StudentList
//
//  Created by Роман Шабаев on 14.01.2022.
//

import SwiftUI

struct StudentList: View {
    
    @StateObject var viewModel = ViewModel()
    @State private var showFavoritesOnyl = false
    @State private var headerFavoritesVisible = true

    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Toggle("Favorites", isOn: $viewModel.showFavoritesOnly)
                        .onAppear {
                            headerFavoritesVisible = false
                        }
                        .onDisappear {
                            headerFavoritesVisible = true
                        }
                    ForEach(viewModel.favoriteSections) { section in
                        Section(header: Text("\(section.title) Developers"), footer: Text("\(section.students.count) Students")) {
                            ForEach(section.students) { student in
                                NavigationLink {
                                    DetailView(student: student, isFavorite: viewModel.getIsFavoriteBinding(for: student))
                                } label: {
                                    StudentRow(student: student, isFavorite: viewModel.getIsFavoriteBinding(for: student))
                                }
                            }
                        }
                    }
                    Button {
                        viewModel.addRandomSection()
                    } label: {
                        Label("Add new section", systemImage: "plus.circle")
                            .foregroundColor(.black)
                    }
                }
                .navigationTitle("Students")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        if headerFavoritesVisible {
                            Toggle("Favorites", isOn: $viewModel.showFavoritesOnly)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.addRandomSection()
                        }) {
                            Image(systemName: "person.fill.badge.plus").imageScale(.large)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .accentColor(.black)
        }
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentList()
    }
}

