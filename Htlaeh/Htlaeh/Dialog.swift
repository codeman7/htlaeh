//
//  Dialog.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/27/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   This class is used for all dialogs within the application
 */
class Dialog : UIView {
   // MARK: Properties
   lazy var backgroundGrey: BackgroundGrey = self.createBackgroundGrey()
   lazy var prompt: UIView = self.createPrompt()
   let promptFrame: CGRect
   
   // MARK: Initalizers
   /**
     Designated Initalizer
     - parameter frame: The frame that the dialog will be
     - parameter promptFrame: The frame for the prompt that will hold the content
   */
   init(frame: CGRect, promptFrame: CGRect) {
      
      // Set the frame for the prompt
      self.promptFrame = promptFrame
      // Call the super initalizer
      super.init(frame: frame)
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      This function creates the background grey behind the dialog itself
   */
   func createBackgroundGrey() -> BackgroundGrey {
      
      let frame: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
      let backgroundGrey: BackgroundGrey = BackgroundGrey(frame: frame)
      return backgroundGrey
      
   }
   
   /// This function creates the prompt that will hold the content
   func createPrompt() -> UIView {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2, y: self.frame.height / 2, width: 0, height: 0)
      let view: UIView = UIView(frame: frame)
      view.elevate(12.0)
      view.backgroundColor = Color().white
      return view
      
   }
   
}

// MARK: Overlay extension
extension Dialog : Overlay {
   
   /**
      This function is used to show the view if it isn't currently viewable by the user
   */
   func showView() {
      
      fatalError("This has to be subclassed")
      /*self.addSubview(backgroundGrey)
      self.addSubview(prompt)
      self.backgroundGrey.show(0.26)
      UIView.animateWithDuration(3.0, delay: 0.0, options: .CurveEaseInOut, animations: {
         self.prompt.frame = self.promptFrame
         }, completion: nil)*/
      
   }
   
   /**
      This function hides the view and removes it from the superview if it is currently there
   */
   func hideView() {
      
      self.backgroundGrey.removeFromSuperview()
      self.prompt.removeFromSuperview()
      self.removeFromSuperview()
      
   }
   
}