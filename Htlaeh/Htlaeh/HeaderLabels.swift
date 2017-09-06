//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/13/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import UIKit

protocol HeaderTextPresentable {
   
   var font: UIFont { get }
   var alignment: NSTextAlignment { get }
   var color: UIColor { get }
   var alpha: CGFloat { get }
   
}

extension HeaderTextPresentable {
   
   var font: UIFont {
      return Fonts.Regular().twenty
   }
   
   var alignment: NSTextAlignment {
      return .Left
   }

   var color: UIColor {
      return Color().black
   }
   
   var alpha: CGFloat {
      return 0.87
   }
   
}

