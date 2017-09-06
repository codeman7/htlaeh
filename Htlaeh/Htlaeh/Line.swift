//
//  Line.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this class to create a UIView that is a just a line
 */
class Line: UIView {
   
   // MARK: Initializers
   /// Designated and only initializer
   init(frame: CGRect, alpha: CGFloat) {
      // Call the super initalizer
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = Color().black
      // Set the alpha of the view
      self.alpha = alpha
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
}