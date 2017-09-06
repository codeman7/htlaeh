//
//  TouchableView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

//// This protocol is for handling touch events for a uiview
protocol Touchable {
   
   /// The action for when the view is touched
   var action: () -> () { get }
   
}
