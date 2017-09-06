//
//  MDButton.swift
//  Htlaeh
//
//  Created by Cody Weaver on 3/28/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit


/**
 This enum is for all the different kinds of buttons
 */
enum ButtonType {
   
   case Flat, Raised, FAB
   
}

/**
  Represents a button within the app
*/
class Button: UIView {
   // MARK: Properties
   /// The type of the button either Flat, FAB, or Raised
   var type: ButtonType {
     
      didSet(type) {
      
         setType(type)
      
      }
   
   }
   
   // Action to call when button is pressed
   var action: (() -> ())? = nil
   
   var icon: Icon? = nil
   
   var label: UILabel?
   
   
    // MARK: Initializers
   /**
    Default initializer
    - parameter frame: The frame for the button
    - parameter type: The type of the button
    */
   init(frame: CGRect, type: ButtonType) {
      
      // Set the type of the button
      self.type = type
      // Call the super initalizer
      super.init(frame: frame)
      // Set the type for the button
      // Have to call it after the frame has been set
      self.setType(self.type)
      
   }
   
   
   /// Required By Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
    // MARK: Style Functions
    func setType(type: ButtonType) {
      
      switch self.type {
      case .Raised:
         // Elevate the view
         self.elevate(1)
         // Set the corner radius for the button
         self.layer.cornerRadius = 2.0
      case .FAB:
         // Elevate the view
         self.elevate(3)
         // Make the view into a circle
         self.layer.cornerRadius = self.frame.width / 2
         // Make sure height and width are the same
         guard self.frame.width == self.frame.height else { fatalError("FAB must have equal height and width") }
      default:
         // The view must be a Flat button so skip
         break
      }
    
   }
   
   
   func addTitle(title: String, color: UIColor) {
      
      let text: String = title.uppercaseString
      let width: CGFloat = text.widthWithConstrainedHeight(19.0, font: Fonts.Medium().fourteen)
      let frame: CGRect = CGRect(x: self.frame.size.width / 2 - (width / 2), y: self.frame.size.height / 2 - 11, width: width, height: 22)
      label = UILabel(frame: frame, font: Fonts.Medium().fourteen, align: .Center, color: color)
      label?.text = text
      self.addSubview(label!)
      
   }
   
   /**
      This method adds an icon to the button that will be 24x24pt at the center of the button
      -parameter image:   Should be the image that the icon is
      -parameter color:   The color that the image will be
   */
   func addIcon(image: UIImage, color: UIColor) {
   
      let frame: CGRect = CGRect(x: self.frame.size.width / 2 - 12, y: self.frame.size.height / 2 - 12, width: 24, height: 24)
      icon = Icon(frame: frame, image: image, color: color)
      self.addSubview(icon!)
      
   }
   
   /**
    This method adds a small icon 20x20 dp in the center of the button
    - parameter image:   Should be the image that the icon is
    - parameter color:   Should be the color of that image
   */
   func addSmallIcon(image image: UIImage, color: UIColor) {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2 - 10, y: self.frame.height / 2 - 10, width: 20, height: 20)
      icon = Icon(frame: frame, image: image, color: color)
      self.addSubview(icon!)
      
   }
    
    // MARK: Logic Functions
   override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
   
      super.touchesBegan(touches, withEvent: event)
      switch self.type {
      
      case .Raised:
      
         self.elevate(4)
        
      case .FAB:
      
         self.elevate(6)
        
      default:
      
         break
        
      }
    
   }
    
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
   
      super.touchesEnded(touches, withEvent: event)
      switch self.type {
      
      case .Raised:
      
         self.elevate(1)
        
      case .FAB:
      
         self.elevate(3)
        
      default:
      
         break
        
      }
      
      guard self.action == nil else {
      
         self.action!()
         return
        
      }
      
      print("Action was nil and must be fixed before production")
    
   }
    
}
