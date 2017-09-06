//
//  ImageView.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/12/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import UIKit

extension UIImageView {
   convenience init(frame: CGRect, image: UIImage) {
      self.init(frame: frame)
      self.image = image
   }
}