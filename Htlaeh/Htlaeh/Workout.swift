//
//  Workout.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/13/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation

/**
 Protocol for a whole workout
 */
protocol WorkoutType {
   
   /// Array of all the Sets/Exercises
   var sets: [WeightSet] { get }
   /// Array of Sets/Exercises that are done
   //var completedSets: [WeightSet] { get }
   /// Array of Sets/Exercises that aren't complete
   //var remainingSets: [WeightSet] { get }
   /// Variable to get the workout count
   var count: Int { get }
   /// Add a set to the workout
   func addSetToWorkout(newSet: WeightSet) -> Self
   /// Remove a set
   //func removeSetFromWorkout(newSet: WeightSet) -> Self
   /// Mark a whole workout as complete, maybe entered after already done
   func markAsComplete() -> Self
   /// Change the date of the workout
   func updateDate(newDate: String) -> Self
   
}

extension WorkoutType {
   
   var count: Int {
      return sets.count
   }
   
}

/**
 Use this struct to create an full Workout
 */

struct Workout: WorkoutType {
   // MARK: Properties
   let sets: [WeightSet]
   var completedSets: [WeightSet] {
      return self.determineCompletedSets()
   }
   var remainingSets: [WeightSet] {
      return self.determineRemainingSets()
   }
   
   // MARK: Initializers
   /// Default initalizers
   init(firstSet: WeightSet) {
      
      self.sets = [firstSet]
      
   }
   
   init(sets: [WeightSet]) {
      
      self.sets = sets
      
   }
   
   // MARK: Functions to conform to protocol
   func addSetToWorkout(newSet: WeightSet) -> Workout {
      
      var tempArray: [WeightSet] = self.sets
      tempArray += [newSet]
      return Workout(sets: tempArray)
      
   }
   
   /*func removeSetFromWorkout(newSet: WeightSet) -> Workout {
      
      
      
   }*/
   
   func markAsComplete() -> Workout {
      
      var tempSetsArray: [WeightSet] = self.sets
      // 'a' is index of array
      for a in 0..<self.count {
         
         var tempSet = self.sets[a]
         tempSet = tempSet.setDone()
         tempSetsArray[a] = tempSet
         
      }
      return Workout(sets: tempSetsArray)
      
   }
   
   func updateDate(newDate: String) -> Workout {
      
      var tempSetsArray: [WeightSet] = self.sets
      // 'a' is index of array
      for a in 0..<self.count {
         
         var tempSet = self.sets[a]
         tempSet = tempSet.changeDate(newDate)
         tempSetsArray[a] = tempSet
         
      }
      return Workout(sets: tempSetsArray)
      
   }
   
   // MARK: Functions
   /// Determines what sets are complete and what ones aren't, used to set completed sets property
   func determineCompletedSets() -> [WeightSet] {
      
      var completedSets: [WeightSet] = []
      for set in self.sets {
         
         if set.complete == true { completedSets += [set] }
         
      }
      
      return completedSets
      
   }
   
   func determineRemainingSets() -> [WeightSet] {
      
      var remainingSets: [WeightSet] = []
      for set in self.sets {
         
         if set.complete == false { remainingSets += [set] }
         
      }
      
      return remainingSets
      
   }
   
}




