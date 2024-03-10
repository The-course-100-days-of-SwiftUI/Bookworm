//
//  AddBookView.swift
//  Bookworm
//
//  Created by Margarita Mayer on 18/01/24.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var date = Date.now
    
    var hasInvalidTitleAuthor: Bool {
        
        if title.isEmpty || author.isEmpty || title.allSatisfy({$0 == " " }) || author.allSatisfy({$0 == " "}) {
            return true
        }
        return false
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    
                    TextField("Author's name", text: $author)
                    
                    Picker("Genres", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                        .labelsHidden()
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: date)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(hasInvalidTitleAuthor)
            }
            .navigationTitle("Add book")
        }
        
    }
}

//#Preview {
//    AddBookView()
//}
