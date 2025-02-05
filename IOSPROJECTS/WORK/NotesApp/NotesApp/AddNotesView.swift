//
//  AddNotesView.swift
//  NotesApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct AddNotesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var content = ""
    @State private var dateCreated = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Notes Title")){
                    TextField("Enter Notes Title", text:$title )
                    TextField("Enter Notes Content", text:$content)
                    TextField("Enter Notes Date", text:$dateCreated)
                }
            }
            .navigationBarTitle("Add New Notes",displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel"){
                    dismiss()
                },
                trailing: Button("Save"){
                    addNotes()
                    dismiss()
                }
                    .disabled(title.isEmpty)
            )
        }
    }
    private func addNotes(){
        let newNotes = Note(context:  viewContext)
        
        newNotes.title = title
        newNotes.content = content
        newNotes.dateCreated = Date()
        
        do{
            try viewContext.save()
        }
        catch{
            print("Error saving note: \(error)")
        }
    }
}

struct AddNotesView_Previews: PreviewProvider {
    static var previews: some View {
        AddNotesView()
    }
}
