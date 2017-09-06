//: Playground - noun: a place where people can play

import Foundation

protocol NumberType {
   var value: Double { get }
}

extension Int: NumberType {
   var value: Double {
      return Double(self)
   }
}
extension Double: NumberType {
   var value: Double {
      return self
   }
}
extension Float: NumberType {
   var value: Double {
      return Double(self)
   }
}

/**
   Defines one set
*/
struct WorkoutSet {
   
}

/**
   Defines all sets of a particual exercise that are not seperated by another exercise
*/
struct Exercise {
   
}

/**
   Defines the whole workout
*/
struct Workout {
   
}

/**
   Defines a users max within a particular exercise
*/
struct Maxes {
   // Functions for doubles
   func epley<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      let a = (reps.value / 30) + 1
      return weight.value * a
   }
   
   func brzycki<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      let a = (0.0278 * reps.value)
      let b = 1.0278 - a
      return weight.value / b
   }
   
   func lander<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      let a = 100 * weight.value
      let b = 101.3 - (2.67123 * reps.value)
      return a / b
   }
   
   func lombardi<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      let a = pow(reps.value, 0.10)
      return a * weight.value
   }
   
   func mayhew<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      let a = 100 * weight.value
      let b = -0.055 * reps.value
      let c = 52.2 + 41.9 * pow(M_E, b)
      return a / c
   }
   
   func oconner<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      let a = 1 + 0.025 * reps.value
      return weight.value * a
   }
   
   func wathen<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      let a = 100 * weight.value
      let b = -0.075 * reps.value
      let c = pow(M_E, b)
      let d = 48.8 + 53.8 * c
      return a / d
   }
   
   func max<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> Double {
      guard reps.value != 1 else { return weight.value }
      var maxesArray = self.createMaxArray(reps: reps, weight: weight)
      // Sort the maxes
      maxesArray = maxesArray.sort()
      // Remove outliers
      maxesArray = self.removeOutliers(maxesArray)
      // Combine all the values
      let maxTotal = maxesArray.reduce(0, combine: +)
      return maxTotal / 3
   }
   
   func createMaxArray<A: NumberType, B: NumberType>(reps reps: A, weight: B) -> [Double] {
      // Find maxes for every formula
      let epley = self.epley(reps: reps, weight: weight)
      let brzycki = self.brzycki(reps: reps, weight: weight)
      let lander = self.lander(reps: reps, weight: weight)
      let lombardi = self.lombardi(reps: reps, weight: weight)
      let mayhew = self.mayhew(reps: reps, weight: weight)
      let oconner = self.oconner(reps: reps, weight: weight)
      let wathen = self.wathen(reps: reps, weight: weight)
      // Create array of maxes
      let maxesArray = [epley, brzycki, lander, lombardi, mayhew, oconner, wathen]
      return maxesArray
   }
   
   func removeOutliers(array: [Double]) -> [Double] {
      var tempArray: [Double] = array
      tempArray.removeLast()
      tempArray.removeLast()
      tempArray.removeFirst()
      tempArray.removeFirst()
      return tempArray
   }

}


/**
   Struct holds functions to find max reps given a weight
   - requires:   Must have a 'User' max for a given exercise and weight they plan to use
 */
struct Reps {
   
   func epley<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      let a = (max.value / weight.value) - 1
      return a * 30
      
   }
   
   func brzycki<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      let a = 1.0278 - (weight.value / max.value)
      return a / 0.0278
      
   }
   
   func lander<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      let a = (100 * weight.value) / max.value
      let b = 101.3 - a
      return b / 2.67123
      
   }
   
   func lombardi<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      let a = max.value / weight.value
      return pow(a, 10.0)
      
   }
   
   // Fix mayhew
   func mayhew<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      let a = ((weight.value * 100) / max.value) - 52.2
      let b = a / 41.9
      let c = log(b) / log(M_E)
      return c / -0.055
      
   }
   
   func oconner<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      let a = (max.value / weight.value) - 1
      return a / 0.025
      
   }
   
   // Fix wathen
   func wathen<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      let x = (weight.value * 100) / max.value
      let y = x - 48.8
      let z = y / 53.8
      let a = log(z) / log(M_E)
      return a / -0.075
      
   }
   
   func max<A: NumberType, B: NumberType>(max max: A, weight: B) -> Double {
      
      guard max.value >= weight.value else { return 0 }
      var repsArray: [Double] = self.createRepsArray(max: max, weight: weight)
      
      repsArray = repsArray.sort()
      repsArray = self.removeOutliers(repsArray)
      let repsTotal = repsArray.reduce(0, combine: +)
      return repsTotal / 3
      
   }
   
   func createRepsArray<A: NumberType, B: NumberType>(max max: A, weight: B) -> [Double] {
      
      let epley = self.epley(max: max, weight: weight)
      let brzycki = self.brzycki(max: max, weight: weight)
      let lander = self.lander(max: max, weight: weight)
      let lombardi = self.lombardi(max: max, weight: weight)
      let mayhew = self.mayhew(max: max, weight: weight)
      let oconner = self.oconner(max: max, weight: weight)
      let wathen = self.wathen(max: max, weight: weight)
      return [epley, brzycki, lander, lombardi, mayhew, oconner, wathen]
      
   }
   
   func removeOutliers(array: [Double]) -> [Double] {
      
      var tempArray: [Double] = array
      tempArray.removeLast()
      tempArray.removeLast()
      tempArray.removeFirst()
      tempArray.removeFirst()
      return tempArray
      
   }
   
}

struct Weight {
   
}

Reps().max(max: 250, weight: 45)
Maxes().max(reps: 5, weight: 213)





