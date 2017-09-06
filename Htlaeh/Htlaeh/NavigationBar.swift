//
//  NavigationBar.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This is the UIView subclass that actually holds all the content of the Menu
 */
class NavigationBar: UIView {
   // MARK: Properties
   
   // MARK: Initializer
   //// Designated Initalizers
   init(frame: CGRect, icons: [UIImage], labels: [String]) {
      // Call the super initalizers
      super.init(frame: frame)
      // Set the background color
      self.backgroundColor = Color().white
      // Add the subviews
      self.addSubviews(icons: icons, labels: labels)
      
   }
   //// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   private func addSubviews(icons icons: [UIImage], labels: [String]) {
      // Add all the branding to the top
      self.addBranding()
      // Add all the buttons
      self.addButtons(icons: icons, labels: labels)
      
   }
   
   private func addBranding() {
      // The frame for the logo
      let logoFrame: CGRect = CGRect(x: 16, y: 120, width: 60, height: 60)
      // Initialize the logo
      let logo: UIImageView = UIImageView(frame: logoFrame, image: Images.Htlaeh().logoSmooth)
      // Add the logo to the view
      self.addSubview(logo)
      // The frame for the word logo
      let wordLogoFrame: CGRect = CGRect(x: 92, y: 120, width: 120, height: 60)
      // Initialize the word logo
      let wordLogo: UIImageView = UIImageView(frame: wordLogoFrame, image: Images.Htlaeh().wordLogo)
      // Add the word logo to the view
      self.addSubview(wordLogo)
      // Add the bottom line
      // Initialize the line
      let line: Line = Line(frame: CGRect(x: 0, y: 196, width: self.frame.width, height: 1), alpha: 0.54)
      // Add the line to the view
      self.addSubview(line)
      
      
   }
   
   /**
      This function is used to add all the buttons
      - parameter Icons: An array of the icons for the buttons
      - parameter Labels: An array of the text of the labels for the button
   */
   private func addButtons(icons icons: [UIImage], labels: [String]) {
      // Make sure there is an equal about of labels and icons
      guard icons.count == labels.count else {
         fatalError("The icons and labels count don't match")
      }
      // Iterate over both the icons and the labels and create the buttons
      for a in 0..<icons.count {
         // Create the frame for the button
         let buttonFrame: CGRect = CGRect(x: 0, y: 197 + (48 * a), width: Int(self.frame.width), height: 48)
         // Create the button
         let button: NavigationButton = NavigationButton(frame: buttonFrame, image: icons[a], label: labels[a])
         // Add the button to the view
         self.addSubview(button)
         
      }
      
   }
   
   /**
      This function is used to elevate the view and move it to the new position
      - parameter X:   Should be the new value that the view is being moved to
   */
   func show(x x: CGFloat) {
      if x > 240 {
         // Move the bar to the new location
         self.frame.origin.x = 240
      } else {
         // Move the bar to new location
         self.frame.origin.x = x
      }
      // Elevate the bar
      self.elevate(8.0)
      
      
   }

   /**
      This function is used to move the view back to being hidden and lower the view
      - parameter X:   The new value for the x position of the view
   */
   func hide(x x: CGFloat) {
      
      // Move the bar to new location
      self.frame.origin.x = x
      // Lower the bar
      self.elevate(0.0)
      
   }
}





