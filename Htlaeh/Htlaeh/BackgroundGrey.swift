//
//  BackgroundGrey.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This class should always be used with the Overlay protocol
   Alpha when visable should be 26%
 */
class BackgroundGrey: UIView {
   
   // MARK: Initializers
   //// Designated Initailzer
   override init(frame: CGRect) {
      // Call the super initalizers
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = Color().black
      // Set the alpha of the view
      self.alpha = 0.0
      
   }
   
   //// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   // MARK: Functions
   func show(alpha: CGFloat) {
      
      UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { self.alpha = alpha }, completion: nil)
      
   }
   
}

// MARK: Extension for the menu type
extension BackgroundGrey: Touchable {
   
   var action: () -> () {
      return {
         if let superView = self.superview as? Overlay {
            superView.hideView()
         }
      }
   }
   
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
      self.action()
      
   }
   
}

