//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/14/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Scroller is used to hold cards
*/
class Scroller: UIScrollView {
   
   // MARK: Properties
   
   // MARK: Initializers
   override init(frame: CGRect) {
      
      super.init(frame: frame)
      self.backgroundColor = Color().grey50
      
   }
   
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
      Function to add workout cards to a scroller
      -parameter data: Should be a workout full of sets
    */
   func addCards<A: WorkoutType>(data: A) {
      // Get all cards width and height
      let cardWidth: Int = Int(self.frame.width) - 16
      let cardHeight: Int = cardWidth * 9 / 16
      // Figure out how many cards and set content size
      let contentHeight: Int = (data.count * (cardHeight + 8)) + 8
      self.contentSize.height = CGFloat(contentHeight)
      // Iterate over data and add the cards
      // a is just placehold variable for iteration
      for a in 0..<data.count {
         // The y position for the card
         let cardY: Int = ((cardHeight + 8) * a) + 8
         // The frame for all the cards
         let frame: CGRect = CGRect(x: 8, y: cardY, width: cardWidth, height: cardHeight)
         // Get the set for the particular iteration
         let set: WeightSet = data.sets[a]
         // Get the data to pass to the card
         let setData: WorkoutCardInit = WorkoutCardInit(exercise: set.name, reps: set.reps, weight: set.weight, restTime: set.restTime)
         // Create all the cards
         let card: WorkoutCard = WorkoutCard(frame: frame, data: setData)
         // Add all the cards to the scroller
         self.addSubview(card)
      }
      
   }
}




