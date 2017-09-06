//
//  LoadingAnimation.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/29/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

private typealias Circle = UIView
extension Circle: RevealAlpha { }
/**
   The view to use in any loading animation
   Should always be 120w by 80h
*/
class Loading: UIView {
   // MARK: Properties
   private var circles: [UIView] = []
   // MARK: Initializers
   /// Default and only initalizers to use
   override init(frame: CGRect) {
      // Call the super initalizer
      super.init(frame: frame)
      // Set the background color for the view
      self.backgroundColor = Color().white
      // Add the circles to the view
      self.addCirlces()
      // Animate the views
      self.animation()
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
      This function is for starting the animation
   */
   private func animation() {
      
      // Animate the red circle
      self.animate(self.circles[0])
      // Show the blue circle
      self.circles[1].showWithAlpha(0.5)
      // Animate the blue circle
      self.delayedAnimate(self.circles[1], delay: 0.5)
      // Show the yellow circle
      self.circles[2].showWithAlpha(1.0)
      // Animate the yellow circle
      self.delayedAnimate(self.circles[2], delay: 1.0)
      
   }
   
   /**
      This function is used to animate the red circle
      -parameter circle:   The cirlce to animate
   */
   private func animate(circle: Circle) {
      
      let anim: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
      anim.path = self.createPath()
      anim.repeatCount = Float.infinity
      anim.duration = 1.5
      anim.beginTime = CACurrentMediaTime()
      circle.layer.addAnimation(anim, forKey: "animate position along path")
      
   }
   
   /**
      This function is used to animate the last two circles
      -parameter cirlce:   The cirlce to animate
      -parameter delay:   The amount of time to wait to start the animation
   */
   private func delayedAnimate(circle: Circle, delay: Double) {
      
      let anim: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
      anim.path = self.createPath()
      anim.repeatCount = Float.infinity
      anim.duration = 1.5
      anim.beginTime = CACurrentMediaTime() + delay
      circle.layer.addAnimation(anim, forKey: "animate position along path")
      
   }
   
   /**
      This function is used to create all three of the cirlce and add them to CIRCLES array
   */
   private func addCirlces() {
      // Create an array of all the colors needed for the cirlces
      let colors: [UIColor] = [Color().red, Color().blue, Color().yellow]
      // Create all the circles and add them to the view
      for color in colors {
         let circle: Circle = self.createCirlce(color)
         // Make the red cirlce visable
         if color == Color().red { circle.alpha = 1.0 }
         self.addSubview(circle)
         // Add circles to circle array
         self.circles += [circle]
      }
      
   }
   
   /**
      This function is used just to create the circles
      -parameter color:   The color of the cirlce
   */
   private func createCirlce(color: UIColor) -> UIView {
      
      let frame: CGRect = CGRect(x: 55, y: 35, width: 10, height: 10)
      let view: UIView = UIView(frame: frame)
      view.layer.cornerRadius = 5.0
      view.backgroundColor = color
      view.alpha = 0.0
      return view
      
   }
   
   /**
      Function just used to create path for the animation
   */
   private func createPath() -> CGPath {
      
      let centerOne: CGPoint = CGPoint(x: 45, y: 35)
      let centerTwo: CGPoint = CGPoint(x: 75, y: 35)
      let radius: CGFloat = 15.0
      let start: CGFloat = CGFloat(M_PI)
      let end: CGFloat = 0.0
      let path1: UIBezierPath = UIBezierPath(arcCenter: centerTwo, radius: radius, startAngle: -start, endAngle: end, clockwise: false)
      let path2: UIBezierPath = UIBezierPath(arcCenter: centerTwo, radius: radius, startAngle: end, endAngle: -start, clockwise: false)
      let path3: UIBezierPath = UIBezierPath(arcCenter: centerOne, radius: radius, startAngle: end, endAngle: start, clockwise: true)
      let path4: UIBezierPath = UIBezierPath(arcCenter: centerOne, radius: radius, startAngle: start, endAngle: end, clockwise: true)
      let paths: UIBezierPath = UIBezierPath()
      paths.appendPath(path1)
      paths.appendPath(path2)
      paths.appendPath(path3)
      paths.appendPath(path4)
      return paths.CGPath
      
   }
}

