//
//  UILabel.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
   convenience init(frame: CGRect, font: UIFont, align: NSTextAlignment, color: UIColor) {
      self.init(frame: frame)
      self.textColor = color
      self.textAlignment = align
      self.font = font
   }
   
   convenience init(config: LabelConfig) {
      self.init(frame: config.frame)
      self.textColor = config.color
      self.textAlignment = config.alignment
      self.font = config.font
   }
   
   convenience init<A: HomeTextPresentable>(frame: CGRect, properties: A) {
      
      self.init(frame: frame)
      self.textColor = properties.color
      self.alpha = properties.alpha
      self.textAlignment = properties.alignment
      self.font = properties.font
      
   }
   
   convenience init<A: HeaderTextPresentable>(frame: CGRect, headerLabel: A) {
      self.init(frame: frame)
      self.textColor = headerLabel.color
      self.font = headerLabel.font
      self.alpha = headerLabel.alpha
      self.textAlignment = headerLabel.alignment
   }
}

struct LabelConfig {
   let frame: CGRect
   let font: UIFont
   let alignment: NSTextAlignment
   let color: UIColor
}

