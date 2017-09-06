//
//  Controller.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/12/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Screen size determines type of iPhone.
*/

/// iPhone 5, iPhone 6, iPhone 6+ etc.

enum ScreenSize {
   
   case Small
   case Medium
   case Large
   
}

class Controller: UIViewController {
   /// Variable to get the size
   var size: ScreenSize {
      switch self.view.frame.size {
      case CGSize(width: 320, height: 568):
         return .Small
      case CGSize(width: 375, height: 667):
         return .Medium
      default:
         return .Large
      }
   }
   
   /// Variable to get the screen's width
   var width: CGFloat {
      return self.view.frame.width
   }
   
   /// Variable to get the screen's height
   var height: CGFloat {
      return self.view.frame.height
   }
}

protocol ViewSetup {
   func setupViews()
}