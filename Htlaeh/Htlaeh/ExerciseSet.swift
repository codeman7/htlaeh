/**
 Protocol to create a set
 */
protocol WorkoutSet {
   
   /// Holds the name of the set
   var name: String { get }
   /// Holds the number of the set within the workout
   var setCount: Int { get }
   /// Holds the number of reps
   var reps: Int? { get }
   /// Holds the rest time which is after the set
   var restTime: Double? { get }
   /// Holds the weight of the set
   var weight: Double? { get }
   /// Holds the time it took to finish the set
   var time: Double? { get }
   /// Holds the date the workout is
   var date: String { get }
   /// Used to determind if set is complete or not
   var complete: Bool { get }
}

/**
 Protocol to update a set after done and doing the set
 */
protocol UpdateSet {
   
   /// Update the weight used in the set
   func updateWeight(weight: Double) -> Self
   /// Update the number of reps completed in the set
   func updateReps(reps: Int) -> Self
   /// Update the time it took to complete the set
   func updateTime(time: Double) -> Self
   /// Marks a set as done
   func setDone() -> Self
   /// Use to change the date of a exercise
   func changeDate(newDate: String) -> Self
   
}

/**
 Exercise Set is for a single set within a workout
 */
struct WeightSet: WorkoutSet {
   
   // MARK: Properties
   let name: String
   let setCount: Int
   let reps: Int?
   let restTime: Double?
   let weight: Double?
   let time: Double?
   let date: String
   var complete: Bool
   
   // MARK: Initializer
   init(name: String, setCount: Int, reps: Int?, restTime: Double?, weight: Double?, time: Double?, date: String, complete: Bool) {
      
      self.name = name
      self.setCount = setCount
      self.reps = reps
      self.restTime = restTime
      self.weight = weight
      self.time = time
      self.date = date
      self.complete = complete
      
   }
   
   // MARK: Creation Methods
   static func createStandardSet(name name: String, setCount: Int, reps: Int, restTime: Double, weight: Double, date: String) -> WeightSet {
      
      return WeightSet(name: name, setCount: setCount, reps: reps, restTime: restTime, weight: weight, time: nil, date: date, complete: false)
      
   }
   
   static func createWorkoutForReps(name name: String, setCount: Int, restTime: Double?, weight: Double, time: Double, date: String) -> WeightSet {
      
      return WeightSet(name: name, setCount: setCount, reps: nil, restTime: restTime, weight: weight, time: time, date: date, complete: false)
      
   }
   
   static func createWorkoutForTime(name name: String, setCount: Int, reps: Int, restTime: Double?, weight: Double, date: String) -> WeightSet {
      
      return WeightSet(name: name, setCount: setCount, reps: reps, restTime: restTime, weight: weight, time: nil, date: date, complete: false)
      
   }
   
}


extension WeightSet: UpdateSet {
   
   // MARK: Functions
   /// Use to mark a set as complete
   func setDone() -> WeightSet {
      
      var newSet = self
      newSet.complete = true
      return newSet
      
   }
   
   /// Use this function to update the weight used if the User changes the weight
   func updateWeight(weight: Double) -> WeightSet {
      // Return a new instance of Exercise Set with the weight updated
      return WeightSet(name: self.name, setCount: self.setCount, reps: self.reps, restTime: self.restTime, weight: weight, time: self.time, date: self.date, complete: self.complete)
      
   }
   
   /// Use this to update the reps a User did often used for an AMRAP or achieved more than they thought
   func updateReps(reps: Int) -> WeightSet {
      // Return a new instance of Exercise Set with the new number of reps completed
      return WeightSet(name: self.name, setCount: self.setCount, reps: reps, restTime: self.restTime, weight: self.weight, time: self.time, date: self.date, complete: self.complete)
      
   }
   
   /// Use this for a workout for time or if they want to time a set
   func updateTime(time: Double) -> WeightSet {
      // Return a new instance of Exercise Set witht the time it took to complete
      return WeightSet(name: self.name, setCount: self.setCount, reps: self.reps, restTime: self.restTime, weight: self.weight, time: time, date: self.date, complete: self.complete)
      
      
   }
   
   /// Use this to update the date of a set
   func changeDate(newDate: String) -> WeightSet {
      // Return new instance of Weight set with the date updated
      return WeightSet(name: self.name, setCount: self.setCount, reps: self.reps, restTime: self.restTime, weight: self.weight, time: self.time, date: newDate, complete: self.complete)
      
   }
   
}




