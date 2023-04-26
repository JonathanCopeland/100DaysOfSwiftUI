//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jonathan Copeland on 24/04/2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = "Your review"
    
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]



    var body: some View {

        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    TextEditor(text: $review)
                        .foregroundColor(review.contains("Your review") ? Color.secondary : Color.primary)
                    
                    RatingView(rating: $rating)
                    
                } header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        
                    
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.date = Date.now
                        
                        if(review.contains("Your review")){
                            newBook.review = ""
                        } else {
                            newBook.review = review
                        }
                        

                        try? moc.save()
                        dismiss()
                    }
                    .disabled(hasValidAddress == false)
                }
            }
            .navigationTitle("Add Book")
        }
        
        
        
    }
    
    var hasValidAddress: Bool {
        if title.isEmpty || author.isEmpty {
            return false
        }


        if(title == " " || author == " ") {
            return false
        }

        return true
    }
    
    

}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
