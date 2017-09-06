//
//  CardStyle.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/17/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import UIKit

/**
   Protocol for the card styles
 */
protocol WorkoutCardStyles {
   // Font for actual content
   var infoFont: UIFont { get }
   // Font for hint text
   var hintFont: UIFont { get }
   // Color for actual content
   var infoTextAlpha: CGFloat { get }
   // Color for hint text
   var hintTextAlpha: CGFloat { get }
   // Alignment for all the text
   var alignment: NSTextAlignment { get }
   // Left icon color
   var leftIconColor: UIColor { get }
   // Left icon image
   var leftImage: UIImage { get }
   // Right icon color
   var rightIconColor: UIColor { get }
   // right icon image
   var rightImage: UIImage { get }
   
}

extension WorkoutCardStyles {
   
   var infoFont: UIFont {
      return Fonts.Regular().twentyFour
   }
   
   var hintFont: UIFont {
      return Fonts.Medium().twelve
   }
   
   var infoTextAlpha: CGFloat {
      return 0.87
   }
   
   var hintTextAlpha: CGFloat {
      return 0.54
   }
   
   var alignment: NSTextAlignment {
      return .Center
   }
   
   var leftIconColor: UIColor {
      return Color().red
   }
   
   var leftImage: UIImage {
      return Images.Navigation().close
   }
   
   var rightIconColor: UIColor {
      return Color().blue
   }
   
   var rightImage: UIImage {
      return Images.Navigation().check
   }
   
}