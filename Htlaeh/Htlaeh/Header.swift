//
//  Header.swift
//  Htlaeh
//
//  Created by Cody Weaver on 9/8/15.
//  Copyright © 2015 Htlaeh. All rights reserved.
//


// TODO: Fix icon type two right for cases where there is two icons on the right
// TODO: Add waterfall scroll type

import Foundation
import UIKit
// MARK: Enum for icons types of header
enum HeaderIconsType {
    case None, NoneLeftOneRight, NoneLeftTwoRight, OneLeftNoneRight, OneLeftOneRight, OneLeftTwoRight
}
// MARK: Enum for different scroll types
enum HeaderScrollType {
    case None, Standard, Seemed//, Waterfall Add waterfall later
}

// MARK: Struct for inializers
/// Inializer properties for the header
struct HeaderInializerOptions {
   let iconType: HeaderIconsType
   let scrollType: HeaderScrollType
   let icons: [UIImage]
   let text: String
}

// MARK: Make initalizer conform the to the standard styles for a header
/// Adds the style to the label
extension HeaderInializerOptions: HeaderTextPresentable {}

/**
   Use this class to create any header within a Controller
*/
class Header: UIView {
   // MARK: Properties
   /// UILabel for the title of the header
   var titleLabel: UILabel?
   /// Bottom line for the seem if there is a seem else nil
   var bottomLine: UIView?
   /// Represents the button on the left typical icon is 'menu' or 'back'
   var leftButton: Button?
   /// Represents the button on the right or nil
   var rightButton: Button?
   /// Represents the button on the right but inside the other button rarely use
   var secondRightButton: Button?
   /// Represnets the button on the right if there is a Flat button with no icon but text instead
   var rightButtonWithLabel: Button?
   
   // MARK: Initializers
   /// Default inializers
   init(frame: CGRect, options: HeaderInializerOptions) {
      
      // Call super initializers
      super.init(frame: frame)
      // Set the background color for all headers
      self.backgroundColor = Color().grey100
      // Determind the type of scroll style
      self.determindScrollType(options.scrollType)
      // Determine the icon style
      self.determineIconStyle(options.iconType, icons: options.icons)
      // Add the title
      self.addTitle(options)
      
   }
   
   /// Initalizers for a button with text instead of icon on the right
   convenience init(frame: CGRect, rightButtonTitle: String, options: HeaderInializerOptions) {
      
      // Call the 
      self.init(frame: frame, options: options)
      self.addRightButtonWithText(rightButtonTitle)
      
   }
   
   /// Required by Apple (IGNORE)
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      Function to determine the icons determine what icons need to be added
      - parameter iconType:   Should be the type of icons in the header
      - parameter icons:   Should be icons listed from left to right (ascending) with left being 0 right being 1
   */
   private func determineIconStyle(iconType: HeaderIconsType, icons: [UIImage]) {
      
      switch iconType {
      case .OneLeftNoneRight:
         self.addLeftIcon(icons[0])
      case .OneLeftOneRight:
         self.addLeftIcon(icons[0])
         self.addRightIcon(icons[1])
      case .OneLeftTwoRight:
         self.addLeftIcon(icons[0])
         self.addRightIcon(icons[1])
         self.addSecondRightIcon(icons[2])
      case .NoneLeftOneRight:
         self.addRightIcon(icons[0])
      case .NoneLeftTwoRight:
         self.addRightIcon(icons[0])
         self.addSecondRightIcon(icons[1])
      case .None:
         break
      }
      
   }
   
   /**
      Function to determine the scroll type style
      - parameter scrollType:   Should be the type of style of the header
   */
   private func determindScrollType(scrollType: HeaderScrollType) {
     
      switch scrollType {
      case .Standard:
         self.elevate(2.0)
      case .Seemed:
         self.addBottomLine()
      case .None:
         break
      }
      
   }
   
   // MARK: Functions for icon type
   /**
      Function to add the left button 'icon' typically 'menu' or 'back' always black
      - parameter icon:   Should be the icon represented in the button
   */
   private func addLeftIcon(icon: UIImage) {
      
      let buttonFrame: CGRect = CGRect(x: 7, y: 20, width: 46, height: 46)
      leftButton = Button(frame: buttonFrame, type: .Flat)
      leftButton?.addIcon(icon, color: Color().black)
      leftButton?.icon?.alpha = 0.87
      self.addSubview(leftButton!)
      
   }
   
   // TODO: Add functionality to change icons colors
   /**
      Function to add the right button with an icon
    
      This icon will always be by default black with an opacity of 87%
      - parameter icon:   Should be the icon represented in the button
   */
   private func addRightIcon(icon: UIImage) {
      
      let buttonFrame: CGRect = CGRect(x: self.frame.width - 53, y: 20, width: 46, height: 46)
      rightButton = Button(frame: buttonFrame, type: .Flat)
      rightButton?.addIcon(icon, color: Color().black)
      rightButton?.icon?.alpha = 0.87
      self.addSubview(rightButton!)
      
   }
   
   /**
      Function to add the second icon on the right 'rarely use'
    
      - parameter icon:   Should be the icon represented in the button
   */
   private func addSecondRightIcon(icon: UIImage) {
      
      let buttonFrame: CGRect = CGRect(x: self.frame.width - 117, y: 20, width: 46, height: 46)
      secondRightButton = Button(frame: buttonFrame, type: .Flat)
      secondRightButton?.addIcon(icon, color: Color().black)
      secondRightButton?.icon?.alpha = 0.87
      self.addSubview(secondRightButton!)
      
   }
   
   /**
      Function to add right icon with a text label
      parameter text:   The string label for the button
   */
   func addRightButtonWithText(text: String) {
      
      let buttonFrame: CGRect = CGRect(x: self.frame.width - 120, y: 26, width: 104, height: 40)
      rightButtonWithLabel = Button(frame: buttonFrame, type: .Flat)
      rightButtonWithLabel?.addTitle(text, color: Color().primary)
      self.addSubview(rightButtonWithLabel!)
      
   }
   
   // MARK: Functions for scroll type
   /**
      Function to add the bottom line to the header
      By default the color is black with an opacity of 26%
   */
   private func addBottomLine() {
      
      if bottomLine != nil { self.addSubview(bottomLine!); return }
      let bottomLineFrame: CGRect = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)
      bottomLine = UIView(frame: bottomLineFrame)
      bottomLine!.backgroundColor = Color().black
      bottomLine?.alpha = 0.13
      self.addSubview(bottomLine!)
      
   }
   
   /**
      Function to remove the shadow/bottom line if scroll type changes
   */
   private func removeCurrentScrollType() {
      
      self.elevate(0)
      self.bottomLine?.removeFromSuperview()
      
   }
   
   /**
      Function to update the scroll type if it needs to be changed
   */
   func updateScrollType(type: HeaderScrollType) {
      
      // Remove the current scroll type
      self.removeCurrentScrollType()
      // Update the new scroll type
      self.determindScrollType(type)
      
   }
   
   // MARK: Accessory functions
   /**
    Function to add the title to the header
    - parameter options:   Options adds all the style of a header label and has the text property
    */
   private func addTitle(options: HeaderInializerOptions) {
      
      let titleFrame: CGRect = CGRect(x: 66, y: 28, width: self.frame.width - 154, height: 28)
      titleLabel = UILabel(frame: titleFrame, headerLabel: options)
      titleLabel?.text = options.text
      self.addSubview(titleLabel!)
      
   }
   
}




