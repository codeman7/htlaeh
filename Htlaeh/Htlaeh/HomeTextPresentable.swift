//
//  HomeTextPresentable.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

protocol HomeTextPresentable {
   var font: UIFont { get }
   var alpha: CGFloat { get }
   var color: UIColor { get }
   var alignment: NSTextAlignment { get }
}

extension HomeTextPresentable {
   
   var alignment: NSTextAlignment {
      return .Center
   }
   
   var color: UIColor {
      return Color().black
   }
   
}

struct HomeContentLabel : HomeTextPresentable {
   let font: UIFont = Fonts.Regular().thirtySix
   let alpha: CGFloat = 0.87
}

struct HomeHint : HomeTextPresentable {
   let font: UIFont = Fonts.Medium().twelve
   let alpha: CGFloat = 0.38
}

struct HomeAccent : HomeTextPresentable {
   let font: UIFont = Fonts.Regular().twentyFour
   let alpha: CGFloat = 0.54
}