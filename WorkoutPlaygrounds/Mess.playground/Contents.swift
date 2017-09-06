//: Playground - noun: a place where people can play

import UIKit

let dict: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var string: String = ""
for a in 0..<3 {
   for b in 0..<3 {
      let rand = Int(arc4random() % 26)
      if b % 3 == 2 {
         let randNum = Int(arc4random() % 10)
         if a % 3 == 2 {
            string = string + "\(dict[rand])\(randNum)"
         } else {
            string = string + "\(dict[rand])\(randNum)-"
         }
         
      } else {
         string = string + "\(dict[rand])"
      }
   }
}


string = string.lowercaseString
print(string)
