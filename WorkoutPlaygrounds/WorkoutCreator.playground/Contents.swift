//: Playground - noun: a place where people can play


import Foundation
import UIKit


func weightedRandomElement<T>(items: [(T, Int)]) -> T {
    let total = UInt32(items.map{$0.1}.reduce(0, combine: +))
    let rand = Int(arc4random_uniform(total))
    
    var sum: Int = 0
    for (element,weight) in items {
        sum += weight
        if rand < sum {
            return element
        }
    }
    
    fatalError("This should never happen")
}


class Workout {
    private let time: Int
    private let maxSets: Int = 50
    private let minSets: Int = 5
    private var exercise: [String] = []
    private var rounds: [Int] = []
    private var repetions: [[Int]] = []
    private var rest: [Int] = []
    private let exercises: [(String, Int)] = [("Snatch", 10), ("Clean & Jerk", 10), ("Deadlift", 7), ("Squat", 4), ("Front Squat", 7), ("Overhead Squat", 7), ("Split Jerk", 7), ("Push Jerk", 3), ("Shoulder Press", 2), ("Drop Overhead Squat Press", 1), ("Snatch Press", 1), ("Snatch Push Press", 1), ("Deficet Snatch Deadlift", 3), ("Deficet Clean Deadlift", 3), ("Goodmorning", 6), ("Romanian Deadlift", 7), ("Bent Over Row", 1), ("Clean Pull", 1), ("Snatch Pull", 1), ("Hang Clean", 2), ("Hang Snatch", 2), ("Pause Clean & Jerk", 2), ("Squat Jerk", 6), ("Pause Snatch", 2), ("Pause Squat", 1), ("Pause Deadlift", 2), ("High Hang Snatch", 5), ("High Hang Clean", 5)]
    
    init(time: Int) {
        self.time = time
        // Get number of exercises
        let a = numberOfExercises()
        // Get exercises
        addExercises(a)
        // Get number of rounds
        addRounds(a)
        // Get number or reps
        addReps(a)
        // Get rest
        addRest(a)
    }
    
    private func numberOfExercises() -> Int {
        let num = [(1,1), (2,2), (3,3), (4,4), (5,3), (6,2), (7,1)]
        return weightedRandomElement(num)
    }
    
    private func addExercises(numberOfExercises: Int) {
        for _ in 0..<numberOfExercises {
            exercise += [weightedRandomElement(exercises)]
        }
    }
    
    private func addRounds(numberOfExercises: Int) {
        let round = [(1,1),(2,2),(3,3),(4,2),(5,1)]
        for _ in 0..<numberOfExercises {
            rounds += [weightedRandomElement(round)]
        }
    }
    
    private func addReps(numberOfExercises: Int) {
        let rep = [(1,1), (2,2), (3,3), (4,4), (5,5), (6,4), (7,3), (8,2), (9,1)]
        let differentReps = [(1,2), (2,1)]
        for a in 0..<numberOfExercises {
            let different = weightedRandomElement(differentReps)
            if different == 1 {
                repetions += [[weightedRandomElement(rep)]]
            } else {
                var round: [Int] = []
                for _ in 0..<rounds[a] {
                    round += [weightedRandomElement(rep)]
                }
                repetions += [round]
            }
        }
    }
    
    private func addRest(numberOfExercises: Int) {
        let rests: [(Int, Int)] = [(0,1),(15,3),(30,5),(45,7), (60, 12)]
        for _ in 0..<numberOfExercises {
            rest += [weightedRandomElement(rests)]
        }
    }
    
    func printWorkout() -> String {
        let start = "Today's workout is as follows\n"
        var workout: String = ""
        for a in 0..<exercise.count {
            workout += "\(a + 1). \(exercise[a]) for \(rounds[a]) sets of \(repetions[a]) reps Rest \(rest[a])\n"
        }
        
        return start + workout
    }
}





let a = Workout(time: 30)
a.printWorkout()


