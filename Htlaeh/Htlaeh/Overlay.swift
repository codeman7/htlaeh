//
//  Overlay.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this protocol for anything that comes up over the screen
   - note: This should be used with Menu or Dialog ONLY
   - note: Always use a background grey with this protocol
*/
protocol Overlay {
   
   /// The transparency of the view
   var opacity: CGFloat { get }
   /// This property holds the action of when the grey is pressed
   var action: () -> () { get }
   /// Use this function to show the view
   func showView()
   /// Use this function to hide the view
   func hideView()
   
}

extension Overlay {
   
   /// The opacity for the background grey will always be 26%
   var opacity: CGFloat {
      return 0.26
   }
   
   /// The action for the background grey will always be to hide the view
   var action: () -> () {
      return { self.hideView() }
   }
   
}