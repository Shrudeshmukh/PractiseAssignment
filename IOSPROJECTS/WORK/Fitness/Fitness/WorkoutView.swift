//
//  WorkoutView.swift
//  Fitness
//
//  Created by admin on 04/02/25.
//

import SwiftUI
import CoreData

struct WorkoutView: View {

    @Environment(\.managedObjectContext)private var viewContext
    @FetchRequest(
        entity: Workout.entity(),
        sortDescriptors: []
    )private var workout: FetchedResults<Workout>
    
    @State private var showAddView = false
    @State private var postToEdit: Workout?
    
    var body: some View {
        NavigationView{
            List{
                ForEach(workout){workouts in
                    NavigationLink(destination:EditWorkoutView(workouts:workouts) ){
                        HStack{
                            VStack{
                                Text(workouts.exerciseName ?? "No Name").font(.headline)
                                
                                Text("\(workouts.duration,specifier:"%.0f" )").font(.subheadline)
                                
                                Text("\(workouts.caloriesBurned,specifier:"%.0f" )").font(.subheadline)
                               
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    .swipeActions{
                        Button(role: .destructive){
                            deleteWorkout(workouts)
                        }
                    label:{
                        Label("Delete", systemImage: "trash")
                    }
                    }
                
                }
            }
            navigationTitle("All Workouts")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action:{
                            showAddView = true
                        })
                        {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddView){
                    WorkoutHistoryScreen()
                }
        }
    }
    private func deleteWorkout(_ workouts: Workout){
        viewContext.delete(workouts)
        
        do{
            try viewContext.save()
        }
        catch{
            print("Error Deleting post: \(error)")
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
