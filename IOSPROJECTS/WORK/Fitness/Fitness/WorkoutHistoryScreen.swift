//
//  WorkoutHistoryScreen.swift
//  Fitness
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct WorkoutHistoryScreen: View {
    @Environment(\.managedObjectContext) private var viewContxet
    @Environment(\.dismiss) private var dismiss
    @State private var exerciseName = ""
    @State private var duration = ""
    @State private var caloriesBurned = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Workout History")){
                    TextField("Enter Excercise Name", text:$exerciseName)
                    TextField("Enter Duration", text:$duration).keyboardType(.decimalPad)
                    TextField("Enter Calories Burned", text:$caloriesBurned).keyboardType(.decimalPad)
                              
                              }
                              }
            .navigationBarTitle("Add New Workout", displayMode: .inline)
            .navigationBarItems(
            leading: Button("Cancel"){
                dismiss()
            },
            trailing: Button("Save"){
                addWorkout()
                dismiss()
            }
                .disabled(exerciseName.isEmpty)
            )
        }
        
        
    }
    private func addWorkout(){
        let newWorkout = Workout(context:  viewContxet)
        
        newWorkout.exerciseName = exerciseName
        newWorkout.duration = Double()
        newWorkout.caloriesBurned = Double()
        
        do{
            try viewContxet.save()
        }
        catch{
            print("Error saving note: \(error)")
        }
    }
}

struct WorkoutHistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutHistoryScreen()
    }
}
