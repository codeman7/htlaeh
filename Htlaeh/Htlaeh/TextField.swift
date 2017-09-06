//
//  TextField.swift
//  Htlaeh
//
//  Created by Cody Weaver on 2/3/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

/*
    FLOATING LABEL Standard height is 78, 16 spacing on top, 16 for floating label, 8 spacing, 22 text, 7 space, 1 line, 8 space
    STANDARD FONT is regular 12 for hint and regular 16 for text
    NON FLOATING LABEL Standard height is 54, 16 spacing on top, 22 text, 7 space, 1 line, 8 space
    FULL WIDTH FIELD Standard height is 52, 16 spacing on top, 22 text, 16 spacing bottom
    BOTTOM CHAR COUNTER/ERROR MESSAGE FONT is 12 regular
    FLOATING LABEL WITH CHAR/ERROR Standard height 94, 16 spacing on top, 16 for floating label, 8 spacing, 22 text, 7 space, 1 line, 4 space, 16 label
*/

import Foundation
import UIKit

class TextField: UITextField {
   // Accent color for the text field
   var color: UIColor = Color().blue
   // Property for floating
   var floating: Bool = true
   // Property for hint/floatingLabel
   private var placeholderLabel: UILabel? = nil
   // Property for the bottom line
   private var bottomLine: UIView? = nil
   // Property for error message
   var errorMessage: String? = nil
   // Property for char counter
   var charLimit: Int? = nil
   // Property for placeholder/hint text
   var hintText: String = "Placeholder" {
   
      willSet(newText) {
      
         placeholderLabel?.text = newText
      
      }
    
   }
   
   // Variable for text and editing bounds
   private var textBounds: CGRect {
   
      if floating == true {
      
         return CGRect(x: 0, y: 40, width: self.frame.size.width, height: 44)
        
      } else {
      
         return CGRect(x: 0, y: 16, width: self.frame.size.width, height: 44)
        
      }
    
   }
    
    
   // Default initializer
   
   override init(frame: CGRect) {
   
      super.init(frame: frame)
      self.delegate = self
      self.borderStyle = .None
      self.font = Fonts.Regular().sixteen
      self.textColor = Color().grey900
      self.setUp()
      self.returnKeyType = .Done
      self.addTarget(self, action: #selector(TextField.textFieldDidChange(_:)), forControlEvents: .EditingChanged)
    
   }
    
   // Initializer for custom properties
   convenience init(frame: CGRect, color: UIColor, floating: Bool, errorMessage: String?, charLimit: Int?) {
   
      self.init(frame: frame)
      self.color = color
      self.floating = floating
      self.errorMessage = errorMessage
      self.charLimit = charLimit
    
   }
    
   // Required by Apple
   required init?(coder aDecoder: NSCoder) {
   
      fatalError("This class does not support NSCoding")
    
   }
    
   // Function to set up all the views
   func setUp() {
      // Check for floating label
      // Set up standards
      self.addPlaceHolder(textBounds)
      if charLimit == nil && errorMessage == nil {
      
         self.addBottomLine(false)
        
      } else {
      
         self.addBottomLine(true)
        
      }
      // Check for charLimit or errorMessage
        
   }
    
   // Function to add floating label
   func addPlaceHolder(rect: CGRect) {
   
      let frame: CGRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.size.width, height: rect.size.height / 2)
      self.placeholderLabel = UILabel(frame: frame, font: Fonts.Regular().sixteen, align: NSTextAlignment.Left, color: Color().grey700)
      self.placeholderLabel?.text = self.hintText
      self.addSubview(self.placeholderLabel!)
   }
    
   // Helper variable is true if char or error are present and false if not
   func addBottomLine(helper: Bool) {
      // Frame for bottom line
      let rect: CGRect
      // Check if there is a char limit or error message
      if helper == false {
      
         if self.frame.size.height == 94 {
            
            // char limit or error message present so move line up
            rect = CGRect(x: 0, y: self.frame.size.height - 22, width: self.frame.size.width, height: 1)
            
         } else {
            
            // No char limit or error message
            rect = CGRect(x: 0, y: self.frame.size.height - 9, width: self.frame.size.width, height: 1)
            
         }
        
      } else {
         
         // char limit or error message present so move line up
         rect = CGRect(x: 0, y: self.frame.size.height - 22, width: self.frame.size.width, height: 1)
      
      }
        
      // Create the line and add to the text field
      bottomLine = UIView(frame: rect)
      bottomLine?.backgroundColor = Color().grey700
      self.addSubview(bottomLine!)
   
   }
    
   
   // Functions for editing and text rect
   override func editingRectForBounds(bounds: CGRect) -> CGRect {
   
      return textBounds
    
   }
    
   override func textRectForBounds(bounds: CGRect) -> CGRect {
   
      return textBounds
    
   }
    
   func bottomRipple(color: Bool) {
   
      let frame: CGRect = CGRect(x: self.frame.size.width / 2, y: 0, width: 0, height: 1)
      let view: UIView = UIView(frame: frame)
      if color == true {
      
         view.backgroundColor = self.color
        
      } else {
      
         view.backgroundColor = Color().grey700
        
      }
      bottomLine?.addSubview(view)
      // Create the animation
      let animate: () -> () = {
         
         view.frame.size.width = self.frame.size.width
         
         view.frame.origin.x = 0
      }
      // Animate the view
      view.standardAnimation(animate)
    
   }
    
    func bottomLineRipple(color: UIColor) {
        let frame: CGRect = CGRect(x: self.frame.size.width / 2, y: 0, width: 0, height: 1)
        let view: UIView = UIView(frame: frame)
        view.backgroundColor = color
        bottomLine?.addSubview(view)
        // Create the animation
        let animate: () -> () = {
            view.frame.size.width = self.frame.size.width
            view.frame.origin.x = 0
        }
        
        // Animate the view
        view.standardAnimation(animate)
    }
    
    func showErrorMessage() {
        guard self.errorMessage != nil else {
            return
        }
        
        let errorLabel = self.subviews.filter({$0.tag == 17}).first as? UILabel
        guard errorLabel == nil else {
            return
        }
        
        let frame: CGRect = CGRect(x: 0, y: self.frame.size.height - 16, width: self.frame.size.width, height: 16)
        let label: UILabel = UILabel(frame: frame, font: Fonts.Regular().twelve, align: .Left, color: Color().red)
        label.text = self.errorMessage
        label.tag = 17
        self.addSubview(label)
        self.placeholderLabel?.textColor = Color().red
        self.bottomLineRipple(Color().red)
    }
    
    func removeErrorMessage() {
        let errorLabel = self.subviews.filter({$0.tag == 17}).first
        if let label = errorLabel {
            UIView.animateWithDuration(0.125, delay: 0.0, options: .CurveEaseInOut, animations: {
                label.alpha = 0.0
                }, completion: {Bool in label.removeFromSuperview()})
        }
    }
    
    // Tag for the label should be 15
    func showCharCounter(color: UIColor?, textString: String) {
        // Make sure text field is tall enough to hold char message
        guard self.frame.size.height == 94  else {
            print("Please make text field 94 pt tall")
            return
        }
        // Check if there is already a label
        guard self.subviews.filter({$0.tag == 15}).first == nil else {
            let label = self.subviews.filter({$0.tag == 15}).first! as! UILabel
            label.text = textString
            return
        }
        
        // Create the label
        let frame: CGRect = CGRect(x: self.frame.size.width - 168, y: self.frame.size.height - 16, width: 160, height: 16)
        let label: UILabel
        if color != nil {
            label = UILabel(frame: frame, font: Fonts.Regular().twelve, align: .Right, color: color!)
        } else {
            label = UILabel(frame: frame, font: Fonts.Regular().twelve, align: .Right, color: Color().red)
        }
        
        label.text = textString
        label.tag = 15
        self.addSubview(label)
    }
    
}

// MARK: UITextFieldDelegate Methods
extension TextField: UITextFieldDelegate {
    // Functions for did begin editing/did end editing
    func textFieldDidBeginEditing(textField: UITextField) {
        // Check if floating is true or not
        if floating == true {
            // Animation for placeholder
            let animate: () -> () = {
                self.placeholderLabel?.font = Fonts.Regular().twelve
                self.placeholderLabel?.frame.origin.y = 16
                self.placeholderLabel?.textColor = self.color
            }
            // Animate placeholder
            self.placeholderLabel?.standardAnimation(animate)
        } else {
            // Floating label isn't present
            self.placeholderLabel?.text = nil
        }
        
        // Animate the bottom line
        self.bottomRipple(true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // Check weather floating label is true or not
        if floating == true {
            // Floating label true so animate accordingly
            // Check if text field has changed
            if self.text == "" || self.text == nil {
                // Text field is empty
                // Animation for placeholder
                let animate: () -> () = {
                    self.placeholderLabel?.font = Fonts.Regular().sixteen
                    self.placeholderLabel?.frame.origin.y = 40
                    self.placeholderLabel?.textColor = Color().grey700
                }
                // Animate the placeholder
                self.placeholderLabel?.standardAnimation(animate)
                
            } else {
                // Text field has changed
                // Animation for placeholder
                let animate: () -> () = {
                    self.placeholderLabel?.textColor = Color().grey700
                }
                // Animate the placeholder
                self.placeholderLabel?.standardAnimation(animate)
                
            }
        } else {
            // Floating labe not true
            self.placeholderLabel?.text = self.hintText
        }
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {
            self.bottomRipple(false)
            }, completion: nil)
    }
    
    func textFieldDidChange(textField:UITextField) {
        let errorLabel = self.subviews.filter({$0.tag == 17}).first
        guard errorLabel != nil else {
            return
        }
        errorLabel?.removeFromSuperview()
        self.bottomLineRipple(self.color)
        self.placeholderLabel?.textColor = self.color
    }
    
    /*func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }*/
}
