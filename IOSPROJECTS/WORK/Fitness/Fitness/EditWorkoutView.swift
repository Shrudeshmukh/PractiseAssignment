//
//  EditWorkoutView.swift
//  Fitness
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct EditWorkoutView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var workouts: Workout
    
    @State private var exerciseName = ""
    @State private var duration = ""
    @State private var caloriesBurned = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Workout")){
                    TextField("Enter Excercise Name", text:$exerciseName)
                    TextField("Enter Duration", text:$duration).keyboardType(.decimalPad)
                    TextField("Enter Calories Burned", text:$caloriesBurned).keyboardType(.decimalPad)
                    
                }
            }
            .navigationBarTitle("Edit workouts", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel"){
                    dismiss()
                },
                trailing: Button("Update"){
                    workouts.exerciseName = exerciseName
                    workouts.duration = Double()
                    workouts.caloriesBurned = Double()
                    //saveContext()
                    dismiss()
                }
                    .disabled(exerciseName.isEmpty)
            )
            .onAppear{
                exerciseName = workouts.exerciseName ?? ""
                duration = String(format: "%.2f,workouts.duration")
                caloriesBurned = String(format: "%.2f,workouts.caloriesBurned")

                
            }
            
            
        }
    }
    
    private func saveContxet(){
        do{
            try viewContext.save()
        }
        catch{
            print("Error saving context: \(error)")
        }
    }
}
