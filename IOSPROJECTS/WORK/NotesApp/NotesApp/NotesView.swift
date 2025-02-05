//
//  NotesView.swift
//  NotesApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct NotesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Note.entity(),
        sortDescriptors: []
    ) private var note: FetchedResults<Note>
    
    @State private var showAddView = false
    @State private var postToEdit: Note?
    
    var body: some View {
        NavigationView{
            List{
                ForEach(note){ notes in
                NavigationLink(destination: EditNotesView(notes: notes)){
                        HStack{
                            VStack{
                                Text(notes.title ?? "No Title").font(.headline)
                                Text(notes.content ?? "No Content")
                                    .font(.subheadline)
                                
                                if let date = notes.dateCreated{
                                    Text(formatDate(date))
                                        .font(.caption)
                                }
                            }
                        }
                    }
                 .buttonStyle(PlainButtonStyle())
                    
                 .swipeActions{
                     Button(role: .destructive){
                         deleteNotes(notes)
                     }
                 label:{
                     Label("Delete", systemImage: "trash")
                 }
                     
                }
            }
        }
            .navigationTitle("All Notes")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showAddView = true
                    })
                    {
                        Image(systemName: "plus")
                    }
                }
                
            }
            .sheet(isPresented: $showAddView){
                AddNotesView()
            }
        }
    }
    private func deleteNotes(_ notes: Note){
        viewContext.delete(notes)
        do{
            try viewContext.save()
        }
        catch{
            print("Error Deleteing post: \(error)")
        }
    }
    
    private func formatDate(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}

