//
//  Time.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation


typealias Time = Double

extension Time {
   
   var minutes: Int {
      return Int(self) / 60
   }
   
   var seconds: Int {
      return Int(self) % 60
   }
   
   var hours: Int {
      return Int(self) / 3600
   }
   
   func toString() -> String {
      
      if self < 3600 {
         return "\(self.minutesAsString()):\(self.secondsAsString())"
      } else {
         return "\(self.hours):\(self.minutesAsString()):\(self.secondsAsString())"
      }
      
   }
   
   func secondsAsString() -> String {
      
      return (self.seconds < 10) ? "0\(self.seconds)" : "\(self.seconds)"
      
   }
   
   func minutesAsString() -> String {
      
      if self.minutes < 10 && self.hours > 1 {
         return "0\(self.minutes)"
      } else {
         return "\(self.minutes)"
      }
      
   }
   
}