// Playground a place to play
import Foundation


enum WorkoutGoal: String {
   case Other = "Other"
   case Weight = "Weight"
   case Reps = "Reps"
   case Time = "Time"
   case Distance = "Distance"
}

struct WorkoutSet {
   var name: String
   var reps: Int? = nil
   var weight: Int? = nil
   var time: Double? = nil
   var rest: Double? = nil
   var set: Int? = nil
   var intensifier: String? = nil
   var goal: WorkoutGoal? = nil
   var distance: Double? = nil
   var unit: String? = nil
   
   // Default init
   init(name: String, reps: Int, weight: Int, goal: WorkoutGoal) {
      self.name = name
      self.reps = reps
      self.weight = weight
      self.goal = goal
   }
   
   // Default init for cardio
   init(name: String, time: Double, distance: Double, unit: String, goal: WorkoutGoal) {
      self.name = name
      self.time = time
      self.distance = distance
      self.goal = goal
      self.unit = unit
   }
   
   // Default init for Amrap
   init(name: String, weight: Int, time: Double, goal: WorkoutGoal){
      self.name = name
      self.weight = weight
      self.time = time
      self.goal = goal
   }
   
   init(name: String, reps: Int, weight: Int, time: Double, rest: Double, set: Int, intensifier: String, goal: WorkoutGoal, distance: Double, unit: String) {
      self.name = name
      self.reps = reps
      self.weight = weight
      self.time = time
      self.rest = rest
      self.set = set
      self.intensifier = intensifier
      self.goal = goal
      self.distance = distance
      self.unit = unit
   }
}

struct Workouts {
   var workout: [WorkoutSet] = []
   
   func countSets() -> Int {
      return workout.count
   }
   
   mutating func addSet(workout: WorkoutSet) {
      self.workout += [workout]
   }
   
   mutating func addSetAtPosition(workout: WorkoutSet, position: Int) {
      self.workout.insert(workout, atIndex: position)
   }
   
   func getSetAtPosition(position: Int) -> WorkoutSet {
      return self.workout[position]
   }
   
   mutating func removeSetAtPosition(position: Int) {
      self.workout.removeAtIndex(position)
   }
   
   subscript(position: Int) -> WorkoutSet {
      return getSetAtPosition(position)
   }
   
}

func +=(lhs: Workouts, rhs: [WorkoutSet])-> Workouts {
   for a in 0..<rhs.count {
      lhs += rhs[a]
   }
   return lhs
}

func +=(lhs: Workouts, rhs: WorkoutSet) -> Workouts {
   var holder = lhs
   holder.workout += [rhs]
   return holder
}



var workouts: [WorkoutSet] = []
var a: Workouts = Workouts()

let cardio: WorkoutSet = WorkoutSet(name: "Run", time: 14.36, distance: 2.0, unit: "mi", goal: .Distance)

let strength: WorkoutSet = WorkoutSet(name: "Squat", reps: 2, weight: 215, goal: .Weight)
let strengthSets: [WorkoutSet] = [WorkoutSet](count: 10, repeatedValue: strength)
let smolovOne: WorkoutSet = WorkoutSet(name: "Snatch", reps: 8, weight: 100, goal: .Weight)
let smolovTwo: WorkoutSet = WorkoutSet(name: "Snatch", reps: 8, weight: 100, goal: .Weight)
let smolovThree: WorkoutSet = WorkoutSet(name: "Snatch", reps: 8, weight: 100, goal: .Weight)
let smolovFour: WorkoutSet = WorkoutSet(name: "Snatch", reps: 5, weight: 110, goal: .Weight)
let smolovFive: WorkoutSet = WorkoutSet(name: "Snatch", reps: 2, weight: 115, goal: .Weight)
let speed: [WorkoutSet] = [smolovOne, smolovTwo, smolovThree, smolovFour, smolovFive]
/*//workouts = [[cardio], strengthSets, speed]
workouts += [cardio]
workouts += [WorkoutSet](count: 10, repeatedValue: strength)
workouts += [smolovOne]
workouts += [smolovTwo]
workouts += [smolovFive]*/
a.countSets()
a.addSet(cardio)
a.countSets()
a.workout.count




