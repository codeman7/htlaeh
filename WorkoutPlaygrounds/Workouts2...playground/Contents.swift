//: Playground - noun: a place where people can play
import Foundation

// MARK: Max
struct Max {
    // Functions for doubles
    func epley(reps reps: Double, weight: Double) -> Double {
        let a = (reps / 30) + 1
        return weight * a
    }
    
    func brzycki(reps reps: Double, weight: Double) -> Double {
        let a = (0.0278 * reps)
        let b = 1.0278 - a
        return weight / b
    }
    
    func lander(reps reps: Double, weight: Double) -> Double {
        let a = 100 * weight
        let b = 101.3 - (2.67123 * reps)
        return a / b
    }
    
    func lombardi(reps reps: Double, weight: Double) -> Double {
        let a = pow(reps, 0.10)
        return a * weight
    }
    
    func mayhew(reps reps: Double, weight: Double) -> Double {
        let a = 100 * weight
        let b = -0.055 * reps
        let c = 52.2 + 41.9 * pow(M_E, b)
        return a / c
    }
    
    func oconner(reps reps: Double, weight: Double) -> Double {
        let a = 1 + 0.025 * reps
        return weight * a
    }
    
    func wathen(reps reps: Double, weight: Double) -> Double {
        let a = 100 * weight
        let b = -0.075 * reps
        let c = pow(M_E, b)
        let d = 48.8 + 53.8 * c
        return a / d
    }
   
   func maxWeight(reps: Int, weight: Double) -> Double {
      let reps = Double(abs(reps))
      guard reps != 1 else {
         return weight
      }
      var maxArray: [Double] = []
      let a = Max().epley(reps: reps, weight: weight)
      let b = Max().brzycki(reps: reps, weight: weight)
      let c = Max().lander(reps: reps, weight: weight)
      let d = Max().lombardi(reps: reps, weight: weight)
      let e = Max().mayhew(reps: reps, weight: weight)
      let f = Max().oconner(reps: reps, weight: weight)
      let g = Max().wathen(reps: reps, weight: weight)
      maxArray = [a,b,c,d,e,f,g]
      maxArray = maxArray.sort(>)
      var returnArray: [Double] = []
      for b in 1..<maxArray.count - 1 {
         returnArray += [maxArray[b]]
      }
      
      var total: Double = 0.0
      for max in returnArray {
         guard max > 0.0 else {
            total += 0.0
            break
         }
         total += max
      }
      
      return total / 5
   }
}

//MARK: Reps struct
struct Reps {
   func epleyReps(max max: Double, usedWeight: Double) -> Double {
      let x = max / usedWeight
      let y = 30 * x
      let z = y - 30
      return z
   }
   
   func brzyckiReps(max max: Double, usedWeight: Double) -> Double {
      let x = usedWeight / max
      let y = x + 1.0278
      let z = y / 0.278
      return z
   }
   
   func landerReps(max max: Double, usedWeight: Double) -> Double {
      let x = (usedWeight * 100) / max
      let y = 101.3 - x
      let z = y / 2.67123
      return z
   }
   
   func lombardiReps(max max: Double, usedWeight: Double) -> Double {
      let x = max / usedWeight
      let y = pow(x, 10.0)
      return y
   }
   
   func mayhewReps(max max: Double, usedWeight: Double) -> Double {
      let x = (usedWeight * 100) / max
      let y = x - 52.2
      let z = y / 41.9
      let a = log(z) / log(M_E)
      let b = a / -0.055
      return b
   }
   
   func oconnerReps(max max: Double, usedWeight: Double) -> Double {
      let x = max / usedWeight
      let y = x - 1
      let z = y / 0.025
      return z
   }
   
   func wathenReps(max max: Double, usedWeight: Double) -> Double {
      let x = (usedWeight * 100) / max
      let y = x - 48.8
      let z = y / 53.8
      let a = log(z) / log(M_E)
      let b = a / -0.075
      return b
   }
   
   func maxReps(max max: Double, usedWeight: Double) -> Double {
      let a = epleyReps(max: max, usedWeight: usedWeight)
      let b = brzyckiReps(max: max, usedWeight: usedWeight)
      let c = landerReps(max: max, usedWeight: usedWeight)
      let d = lombardiReps(max: max, usedWeight: usedWeight)
      let e = oconnerReps(max: max, usedWeight: usedWeight)
      let f = mayhewReps(max: max, usedWeight: usedWeight)
      let g = wathenReps(max: max, usedWeight: usedWeight)
      var repsArray = [a,b,c,d,e,f,g]
      repsArray = repsArray.sort(<)
      var z: Double = 0.0
      for i in 1 ..< repsArray.count - 1 {
         z += repsArray[i]
      }
      z = z / 5
      if max == usedWeight {
         return 1.0
      } else {
         return z
      }
   }
   
   func maxRepsAtPercent(max max: Double, usedWeight: Double, percent: Double) -> Double {
      let localPercent: Double
      if percent > 1 {
         localPercent = percent / 100
      } else {
         localPercent = percent
      }
      let max = max * localPercent
      return self.maxReps(max: max, usedWeight: usedWeight)
   }
}

Reps().epleyReps(max: 225, usedWeight: 205)

struct Weight {
   func epleyWeight(reps reps: Double, max: Double) -> Double {
      let a = 1 + (reps / 30)
      let b = max / a
      return b
   }
   
   func brzyckiWeight(reps reps: Double, max: Double) -> Double {
      let a = 1.0278 - (0.0278 * reps)
      let b = max * a
      return b
   }
   
   func landerWeight(reps reps: Double, max: Double) -> Double {
      let a = 101.3 - (2.67123 * reps)
      let b = max * a
      let c = b / 100
      return c
   }
   
   func lombardiWeight(reps reps: Double, max: Double) -> Double {
      let a = pow(reps, 0.1)
      let b = max / a
      return b
   }
   
   func mayhewWeight(reps reps: Double, max: Double) -> Double {
      let a = -0.055 * reps
      let b = pow(M_E, a)
      let c = 52.2 + (41.9 * b)
      let d = max * c
      let e = d / 100
      return e
   }
   
   func oconnerWeight(reps reps: Double, max: Double) -> Double {
      let a = 0.025 * reps
      let b = 1 + a
      let c = max / b
      return c
   }
   
   func wathenWeight(reps reps: Double, max: Double) -> Double {
      let a = -0.075 * reps
      let b = pow(M_E, a)
      let c = (53.8 * b) + 48.8
      let d = (max * c) / 100
      return d
   }
   
   func usableWeight(reps: Double, max: Double) -> Double {
      let a = epleyWeight(reps: reps, max: max)
      let b = brzyckiWeight(reps: reps, max: max)
      let c = landerWeight(reps: reps, max: max)
      let d = lombardiWeight(reps: reps, max: max)
      let e = mayhewWeight(reps: reps, max: max)
      let f = oconnerWeight(reps: reps, max: max)
      let g = wathenWeight(reps: reps, max: max)
      var weight = [a, b, c, d, e, f, g]
      weight = weight.sort(<)
      var x: Double = 0
      print(weight[0])
      for z in 1...weight.count - 2 {
         x += weight[z]
      }
      x = x / 5
      if reps == 1.0 {
         return max
      } else {
         
         return x
      }
   }
   
   func usableWeightWithPercent(reps reps: Double, max: Double, percent: Double) -> Double {
      let localPercent: Double
      if percent > 1 {
         localPercent = percent / 100
      } else {
         localPercent = percent
      }
      return self.usableWeight(reps, max: (max * localPercent))
   }
}



let max = Weight().usableWeightWithPercent(reps: 2, max: 155, percent: 0.90)

