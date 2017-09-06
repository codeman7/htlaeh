//
//  BoldHeader.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/25/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This enum is used to determine the button layouts for the header
 */
enum HeaderButtonLayout {
   
   case OneLeftNoneRight, OneLeftOneRight, OneLeftTwoRight, OneLeftFlatRight
   
}

enum HeaderType {
   case Home(HomeHeader)
}

/**
 This is the class that holds the default header
 */
class BoldHeader: UIView {
   // MARK: Properties
   /// Scroll type
   // Defaults to false
   var elevated: Bool = false
   
   // MARK: Initalizer
   /**
      Default initalizer
      - parameter frame: The frame that the header will have
      - parameter options: All the settins for the content of the header
   */
   init(frame: CGRect, options: HeaderType) {
      
      super.init(frame: frame)
      self.backgroundColor = Color().white
      switch options {
      case .Home (let settings):
         self.addHomeContent(content: settings)
      }
      
      
   }
   
   /**
      Required by Apple NEVER USE
   */
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   /**
      This function creates a header for the home controller
      - parameter content: All the content for the header
   */
   private func addHomeContent(content content: HomeHeader) {
      
      self.addTitle(text: content.title)
      self.addButton(icon: content.leftIcon, action: content.leftButtonAction, xPosition: 24)
      self.addButton(icon: content.rightIcon, action: content.rightButtonAction, xPosition: Int(self.frame.width - 48))
      self.addDate()
      
   }
   /**
      This function is used to add the title to the header
      - parameter text: The text property for the title
   */
   private func addTitle(text text: String) {
      // Set the frame for the title
      let frame: CGRect = CGRect(x: 72, y: 20, width: 180, height: 48)
      // Set up all the configurations for the label
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: Fonts.Bold().thirtySix, alignment: .Left, color: Color().black)
      // Create the label
      let title: UILabel = UILabel(config: labelConfig)
      // Set the alpha for the label
      title.alpha = 0.87
      // Set the text for the label
      title.text = text
      // Add the label to the header
      self.addSubview(title)
      
   }
   
   private func addDate() {
      
      let date: Date = Date()
      let stringDate = "\(date.monthAsString()) \(date.day), \(date.year)"
      let frame: CGRect = CGRect(x: 72, y: 72, width: 120, height: 21)
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: Fonts.Regular().sixteen, alignment: .Left
         , color: Color().black)
      let label: UILabel = UILabel(config: labelConfig)
      label.text = stringDate
      label.alpha = 0.54
      self.addSubview(label)
      
   }
   
   /**
      This function is used to add all the buttons to the view
      - parameter icon: The icon that the button will have
      - parameter action: The action that the button will have
      - parameter xPosition: The 'x' position that the button will be in the view
   */
   private func addButton(icon icon: UIImage, action: ()->(), xPosition: Int) {
      
      // Set the frame for the button
      let frame: CGRect = CGRect(x: xPosition, y: 33, width: 24, height: 24)
      // Create the button
      let button: Button = Button(frame: frame, type: .Flat)
      // Add the icon to the button
      button.addIcon(icon, color: Color().black)
      // Set the action for the button
      button.action = action
      // Set the buttons icons alpha
      button.icon?.alpha = 0.87
      // Set background color for button
      button.backgroundColor = Color().white
      // Add the button to the header
      self.addSubview(button)
      
   }
   
}