//
//  Logo.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

class Logo: UIImageView {
   // MARK: Properties
   
   // MARK: Initializers
   // Default Inizializer
   init(point: CGPoint) {
      let frame: CGRect = CGRect(origin: point, size: CGSize(width: 120, height: 120))
      super.init(frame: frame)
      self.image = Images.Htlaeh().logoSmooth
   }
   
   // Requierd by Apple
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
}