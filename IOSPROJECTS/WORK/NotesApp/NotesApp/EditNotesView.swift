//
//  EditNotesView.swift
//  NotesApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct EditNotesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var notes: Note
    @State private var title = ""
    @State private var content = ""
    @State private var dateCreated = Date()

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Title")){
                    TextField("Edit Notes Title", text:$title )
                    TextField("Edit Notes Content", text:$content)
                    DatePicker("Edit Notes Date", selection: $dateCreated, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    
                }
            }
            .navigationBarTitle("Edit Notes",displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel"){
                    dismiss()
                },
                trailing: Button("Update"){
                    notes.title = title
                    notes.content = content
                    notes.dateCreated = dateCreated
                saveContext()
                    dismiss()
                }
                    .disabled(title.isEmpty)
            )
            .onAppear{
                title = notes.title ?? ""
                content = notes.content ?? ""
                dateCreated = notes.dateCreated ?? Date()
            }
        }
    }
    private func saveContext(){
       
        do{
            try viewContext.save()
        }
        catch{
            print("Error saving note: \(error)")
        }
    }
}
