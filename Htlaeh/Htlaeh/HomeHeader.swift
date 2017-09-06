//
//  HomeHeader.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

protocol Head {
   var title: String { get }
   var leftIcon: UIImage { get }
}

struct HomeHeader {
   let rightIcon: UIImage
   let rightButtonAction: () -> ()
   let leftButtonAction: () -> ()
   init(left: () -> (), right: () -> ()) {
      self.rightIcon = Images.Navigation().more
      self.rightButtonAction = right
      self.leftButtonAction = left
   }
}

extension HomeHeader : Head {
   var title: String { return "Home" }
   var leftIcon: UIImage { return Images.Navigation().menu }
}