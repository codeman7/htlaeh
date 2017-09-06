//
//  Dragable.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit
/**
   Anything that can swipe or be dragged
   Replacement for UIPanGesture
 */
protocol Draggable {
   
   var dragAction: (Int) -> () { get }
   
   var dragFinished: (Int) -> () { get }
   
}
