//
//  Layout.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

enum Alignment {
   case Left, Right
}

protocol Layout {
   func halfCentered(side side: Alignment, size: CGFloat) -> CGFloat
}

extension CGFloat : Layout {
   
   func halfCentered(side side: Alignment, size: CGFloat) -> CGFloat {
      
      let halfWidth: CGFloat = self / 2
      let differenceForHalf: CGFloat = halfWidth - size
      let startPoint: CGFloat = differenceForHalf / 2
      return (side == .Left) ? startPoint : halfWidth + startPoint
      
   }
   
}