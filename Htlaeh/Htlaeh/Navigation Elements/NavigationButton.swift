//
//  NavigationButton.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/1/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This class should only be used with the Navigation Bar
   All these buttons are the buttons used in the navigation bar
   They should always have an icon and a label
   The Button should be the width of the navigation bar and 48pt tall
   The icon should be 16pt inset and be 24x24 and should be 54% opacity black
   The labels should be 72pt inset and 14 Roboto Medium with 87% opacity black
 */
class NavigationButton: Button {
   // MARK: Properties 
   
   // MARK: Initailzers
   /**
      Designated initializers
      - parameter Frame: The frame of the button
      - parameter Image: The image that the icon will have
      - parameter Label: The text property for the label
   */
   init(frame: CGRect, image: UIImage, label: String) {
      
      // Call the super initializer
      super.init(frame: frame, type: .Flat)
      // Add the image
      self.addIcon(image: image)
      // Add the label
      self.addLabel(text: label)
      
   }
   
   //// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
      This function is used to add the icon to the button
      - parameter Image:   Should be the image that the icon will have
      - note:   For interal use only
   */
   private func addIcon(image image: UIImage) {
      // Create the frame for the icon
      let iconFrame: CGRect = CGRect(x: 16, y: 12, width: 24, height: 24)
      // Create the icon
      let icon: Icon = Icon(frame: iconFrame, image: image, color: Color().black)
      // Set the opacity for the icon
      icon.alpha = 0.54
      // Add the icon to the button
      self.addSubview(icon)
      
   }
   
   /**
      This function is used to add the label to the button
      - parameter Label:   Should be the text that the label will have
      - note: For interal use only
   */
   private func addLabel(text text: String) {
      // Create the frame for the label
      let labelFrame: CGRect = CGRect(x: 72, y: 15, width: self.frame.width - 72, height: 18)
      // Set all the default values for the label
      let labelConfig: LabelConfig = LabelConfig(frame: labelFrame, font: Fonts.Medium().fourteen, alignment: .Left, color: Color().black)
      // Create the label
      let label: UILabel = UILabel(config: labelConfig)
      // Set the labels text property equal the value passed
      label.text = text
      // Set the opacity of the label
      label.alpha = 0.87
      // Make sure the label can hold long values
      label.lineBreakMode = .ByClipping
      // Add the label to the button
      self.addSubview(label)
      
   }
   
}




