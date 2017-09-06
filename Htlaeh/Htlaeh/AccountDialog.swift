//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 7/28/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this class to create the account dialog that prompts users to create an account
 */
class AccountDialog: Dialog {
   // MARK: Properties
   var skipButtonAction: (() -> ())? = nil
   var signInButtonAction: (()->())? = nil
   
   // MARK: Initalizers
   /**
     Designated Initalizer
     - parameter frame: The frame that the dialog will be
     - parameter action1: The action for the far right button "Skip"
     - parameter action2: The action for the far left button "Sign in"
   */
   init(frame: CGRect, promptFrame: CGRect, action1: ()->(), action2: ()->()) {
      
      // Call the super initalizer
      super.init(frame: frame, promptFrame: promptFrame)
      // Set the actions
      self.skipButtonAction = action1
      self.signInButtonAction = action2
      
   }
   
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      fatalError("This class does not support NSCoding")
   }
   
   // MARK: Functions
   /**
      This function creates the dialog itself
      - parameter action1: The action for the far right button "Skip"
      - parameter action2: The action for the far left button "Sign in"
   */
   func createDialog(action1 action1: ()->(), action2: ()->()) {
      
      self.addTopHalf()
      self.addMessages()
      self.addButtons(action1: action1, action2: action2)
      
   }
   
   
   func addTopHalf() {
      
      let frame: CGRect = CGRect(x: 0, y: 0, width: self.prompt.frame.width, height: 125)
      let view: UIView = UIView(frame: frame)
      view.backgroundColor = Color().blue
      self.prompt.addSubview(view)
      
      let imageFrame: CGRect = CGRect(x: self.prompt.frame.width / 2 - 24, y: 16, width: 48, height: 48)
      let image: Icon = Icon(frame: imageFrame, image: Images.Action().account, color: Color().white)
      view.addSubview(image)
      
      let height = "Why set up an account?".heightWithConstrainedWidth(self.prompt.frame.width - 32, font: Fonts.Regular().eighteen)
      let messageFrame: CGRect = CGRect(x: 16, y: view.frame.height - (height + 16), width: self.prompt.frame.width - 32, height: height)
      let message: UILabel = UILabel(frame: messageFrame, font: Fonts.Regular().eighteen, align: .Left, color: Color().white)
      message.text = "Why set up an account?"
      message.numberOfLines = 0
      message.lineBreakMode = .ByWordWrapping
      view.addSubview(message)
      
   }
   
   func addMessages() {
      
      let firstImageFrame: CGRect = CGRect(x: 16, y: 149, width: 24, height: 24)
      let firstIcon: Icon = Icon(frame: firstImageFrame, image: Images.Hardware().devices, color: Color().black)
      firstIcon.alpha = 0.54
      self.prompt.addSubview(firstIcon)
      
      let firstMessage: String = "Sync your workouts across multiple devices"
      let firstFrame: CGRect = CGRect(x: 56, y: 149, width: 168, height: firstMessage.heightWithConstrainedWidth(168, font: Fonts.Regular().sixteen))
      let first: UILabel = UILabel(frame: firstFrame, text: firstMessage)
      self.prompt.addSubview(first)
      
      let secondImageFrame: CGRect = CGRect(x: 16, y: 149 + firstFrame.height + 24, width: 24, height: 24)
      let secondIcon: Icon = Icon(frame: secondImageFrame, image: Images.Editor().free, color: Color().black)
      secondIcon.alpha = 0.54
      self.prompt.addSubview(secondIcon)
      
      let secondFrame: CGRect = CGRect(x: 56, y: 149 + firstFrame.height + 24, width: 168, height: 22)
      let second: UILabel = UILabel(frame: secondFrame, text: "It's free")
      self.prompt.addSubview(second)
      
      let thirdImageFrame: CGRect = CGRect(x: 16, y: secondFrame.origin.y + 24 + secondFrame.height, width: 24, height: 24)
      let thirdIcon: Icon = Icon(frame: thirdImageFrame, image: Images.File().cloud, color: Color().black)
      thirdIcon.alpha = 0.54
      self.prompt.addSubview(thirdIcon)
      
      let thirdMessage: String = "Back up all your workouts to the cloud"
      let thirdFrame: CGRect = CGRect(x: 56, y: secondFrame.origin.y + 24 + secondFrame.height, width: 168, height: thirdMessage.heightWithConstrainedWidth(168, font: Fonts.Regular().sixteen))
      let third: UILabel = UILabel(frame: thirdFrame, text: thirdMessage)
      self.prompt.addSubview(third)
      
      
   }
   
   func addButtons(action1 action1: ()->(), action2: ()->()) {
      
      let skipButtonFrame: CGRect = CGRect(x: self.prompt.frame.width - 88, y: self.prompt.frame.height - 56, width: 72, height: 40)
      let skipButton: Button = Button(frame: skipButtonFrame, type: .Flat)
      skipButton.addTitle("SKIP", color: Color().blue)
      skipButton.backgroundColor = Color().white
      skipButton.action = action1
      self.prompt.addSubview(skipButton)
      
      let signInButtonFrame: CGRect = CGRect(x: skipButtonFrame.origin.x - 88, y: skipButtonFrame.origin.y, width: 72, height: 40)
      let signInButton: Button = Button(frame: signInButtonFrame, type: .Flat)
      signInButton.addTitle("SIGN IN", color: Color().blue)
      signInButton.backgroundColor = Color().white
      signInButton.action = action2
      self.prompt.addSubview(signInButton)
      
   }
   
}

extension AccountDialog {
   
   override func showView() {
      self.addSubview(backgroundGrey)
      self.addSubview(prompt)
      self.backgroundGrey.show(0.26)
      UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: {
         self.prompt.frame = self.promptFrame
         }, completion: { Bool in
            self.createDialog(action1: { self.skipButtonAction!() }, action2: { self.signInButtonAction!() })
      })
   }
   
}

private extension UILabel {
   
   convenience init(frame: CGRect, text: String) {
      
      // Call the designated initalizer
      self.init(frame: frame)
      // Set the text of the label
      self.text = text
      // Set the alpha
      self.alpha = 0.74
      // Set the font
      self.font = Fonts.Regular().sixteen
      // Set the alignment
      self.textAlignment = .Left
      // Set the color
      self.textColor = Color().black
      // Set the number of lines
      self.numberOfLines = 0
      // Set the word break mode
      self.lineBreakMode = .ByWordWrapping
      
   }
   
}