//
//  Date.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/16/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation

typealias Date = NSDate
extension Date {
   
   var day: Int {
      let cal = NSCalendar.currentCalendar()
      let comp = cal.component(.Day, fromDate: self)
      return comp
   }
   
   var month: Int {
      let cal = NSCalendar.currentCalendar()
      let comp = cal.component(.Month, fromDate: self)
      return comp
   }
   
   var year: Int {
      let cal = NSCalendar.currentCalendar()
      let comp = cal.component(.Year, fromDate: self)
      return comp
   }
   
   func today() -> String {
      
      let cal = NSCalendar.currentCalendar()
      let components = cal.components([.Year, .Month, .Day], fromDate: self)
      let year = self.currentYear(components)
      let month = self.currentMonth(components)
      let day = self.currentDay(components)
      return "\(year)\(month)\(day)"
      
   }
   
   func currentYear(comp: NSDateComponents) -> String {
      
      let year = comp.year - 2000
      return "\(year)"
      
   }
   
   func currentMonth(comp: NSDateComponents) -> String {
      
      let month = comp.month
      guard month > 10 else {
         return "0\(month)"
      }
      return "\(month)"
   }
   
   func currentDay(comp: NSDateComponents) -> String {
      
      let day = comp.day
      guard day > 10 else {
         return "0\(day)"
      }
      return "\(day)"
      
   }
   
   func monthAsString() -> String {
      
      let dateFormatter: NSDateFormatter = NSDateFormatter()
      let month = dateFormatter.monthSymbols
      return month[self.month - 1]
      
   }
   
}