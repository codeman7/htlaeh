//
//  StandardAnimation.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
   func standardAnimation(animation: () -> Void) {
      UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: animation, completion: nil)
   }
   
   func animations(animation: ()->Void, duration: NSTimeInterval) {
      UIView.animateWithDuration(duration, delay: 0.0, options: .CurveEaseInOut, animations: animation, completion: nil)
   }
   
}