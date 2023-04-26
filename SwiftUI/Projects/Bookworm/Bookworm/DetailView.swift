//
//  DetailView.swift
//  Bookworm
//
//  Created by Jonathan Copeland on 25/04/2023.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
        
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()

                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)


            if(book.review != "") {
                Text(book.review ?? "No review")
                    .padding()
            }

            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
                .padding()
            
            if let date = book.date {
                Text(date.formatted(date: .abbreviated, time: .omitted))
                    .padding()
            }
            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        
    }
    
    func deleteBook() {
        moc.delete(book)

        try? moc.save()
        dismiss()
    }
    
}

