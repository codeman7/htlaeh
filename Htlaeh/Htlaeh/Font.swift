//
//  Font.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This Enum is strictly for typefaces that raw value are mapped to the name of the font
 */
public enum Typeface: String {
   
   case Thin = "Roboto-Thin"
   case Bold = "Roboto-Bold"
   case Regular = "Roboto-Regular"
   case Medium = "Roboto-Medium"
   case Light = "Roboto-Light"
   
}

/// Extension to accept values from typeface in initializer
extension UIFont {
   convenience public init(name: Typeface, size: CGFloat) {
      self.init(name: name.rawValue, size: size)!
   }
   
}

/**
   Use this struct for all Fonts the sub structs are for each different typeface
 */
struct Fonts {
   struct Thin {
      // MARK: Thin
      let eight: UIFont = UIFont(name: .Thin, size: 8.0)
      let thirtyTwo: UIFont = UIFont(name: .Thin, size: 32.0)
      let fourty: UIFont = UIFont(name: .Thin, size: 40.0)
   }
   
   struct Bold {
      // MARK: Bold
      let six: UIFont = UIFont(name: .Bold, size: 6.0)
      let eight: UIFont = UIFont(name: .Bold, size: 8.0)
      let twelve: UIFont = UIFont(name: .Bold, size: 12.0)
      let thirtySix: UIFont = UIFont(name: .Bold, size: 36.0)
      let fourty: UIFont = UIFont(name: .Bold, size: 40.0)
   }
   
   struct Regular {
      // MARK: Regular
      let twelve: UIFont = UIFont(name: .Regular, size: 12.0)
      let fourteen: UIFont = UIFont(name: .Regular, size: 14.0)
      let sixteen: UIFont = UIFont(name: .Regular, size: 16.0)
      let eighteen: UIFont = UIFont(name: .Regular, size: 18.0)
      let twenty: UIFont = UIFont(name: .Regular, size: 20.0)
      let twentyFour: UIFont = UIFont(name: .Regular, size: 24.0)
      let thirtyTwo: UIFont = UIFont(name: .Regular, size: 32.0)
      let thirtySix: UIFont = UIFont(name: .Regular, size: 36.0)
      let fourty: UIFont = UIFont(name: .Regular, size: 40.0)
      let sixty: UIFont = UIFont(name: .Regular, size: 60.0)
   }
   
   struct Light {
      // MARK: Light
      let eight: UIFont = UIFont(name: .Light, size: 8.0)
      let ten: UIFont = UIFont(name: .Light, size: 10.0)
      let twelve: UIFont = UIFont(name: .Light, size: 12.0)
      let twenty: UIFont = UIFont(name: .Light, size: 20.0)
      let twentyFour: UIFont = UIFont(name: .Light, size: 24.0)
      let thrityTwo: UIFont = UIFont(name: .Light, size: 32.0)
      let fourty: UIFont = UIFont(name: .Light, size: 40.0)
      let fourtyEight: UIFont = UIFont(name: .Light, size: 48.0)
      let fiftySix: UIFont = UIFont(name: .Light, size: 56.0)
      let seventyTwo: UIFont = UIFont(name: .Light, size: 72.0)
   }
   
   struct Medium {
      // MARK: Medium
      let eight: UIFont = UIFont(name: .Medium, size: 8.0)
      let ten: UIFont = UIFont(name: .Medium, size: 10.0)
      let twelve: UIFont = UIFont(name: .Medium, size: 12.0)
      let fourteen: UIFont = UIFont(name: .Medium, size: 14.0)
      let sixteen: UIFont = UIFont(name: .Medium, size: 16.0)
      let eighteen: UIFont = UIFont(name: .Medium, size: 18.0)
      let twenty: UIFont = UIFont(name: .Medium, size: 20.0)
      let twentyFour: UIFont = UIFont(name: .Medium, size: 24.0)
      let thirtyTwo: UIFont = UIFont(name: .Medium, size: 32.0)
      let fourty: UIFont = UIFont(name: .Medium, size: 40.0)
   }
}

