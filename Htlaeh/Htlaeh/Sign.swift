//
//  ViewController.swift
//  Htlaeh
//
//  Created by Cody Weaver on 5/31/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import UIKit
import DigitsKit

class Sign: Controller {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
   }
   
   func digitsSignIn() {
      
      let digits = Digits.sharedInstance()
      let config = DGTAuthenticationConfiguration(accountFields: .DefaultOptionMask)
      config.appearance = self.digitsApperance()
      digits.authenticateWithViewController(nil, configuration: config, completion: { (session, error) in
         print("The session = \(session?.userID) number = \(session?.phoneNumber)\nError = \(error)")
      })
      print("Sign into digits if not fixed fatal error")
      
   }
   
   func skipSignIn() {
      
      let dialogFrame: CGRect = CGRect(x: self.width / 2 - 120, y: self.height / 2 - 220, width: 240, height: 425)
      let dialog: AccountDialog = AccountDialog(frame: self.view.frame, promptFrame: dialogFrame, action1: { self.segueToHome() }, action2: { self.digitsSignIn() })
      self.view.addSubview(dialog)
      dialog.showView()
      
   }
   
   func digitsApperance() -> DGTAppearance {
      
      let apperance = DGTAppearance()
      apperance.backgroundColor = Color().white
      apperance.accentColor = Color().blue
      apperance.logoImage = Images.Htlaeh().logoSmooth
      apperance.headerFont = Fonts.Regular().sixteen
      apperance.labelFont = Fonts.Medium().fourteen
      return apperance
      
   }
   
   func segueToHome() {
      
      print("Segue home")
      
   }
}

/**
   Extension to add all the views to the page and make Sign conform the View Setup
 */
extension Sign: ViewSetup {
   func setupViews() {
      
      // Set background color
      self.view.backgroundColor = Color().white
      
      // Add the logo
      let logo: Logo = Logo(point: CGPoint(x: self.width / 2 - 60, y: 96))
      self.view.addSubview(logo)
      
      // Add the welcome message
      let welcomeFrame: CGRect = CGRect(x: self.width / 2 - 55, y: 232, width: 110, height: 16)
      let welcomeConfig: LabelConfig = LabelConfig(frame: welcomeFrame, font: Fonts.Bold().twelve, alignment: .Left, color: Color().black)
      let welcomeMessage: UILabel = UILabel(config: welcomeConfig)
      welcomeMessage.alpha = 0.54
      welcomeMessage.text = "Welcome to,"
      self.view.addSubview(welcomeMessage)
      
      // Add the big text
      let htlaehTextFrame: CGRect = CGRect(x: self.width / 2 - 55, y: 248, width: 110, height: 48)
      let htlaehTextConfig: LabelConfig = LabelConfig(frame: htlaehTextFrame, font: Fonts.Bold().thirtySix, alignment: .Left, color: Color().black)
      let htlaehText: UILabel = UILabel(config: htlaehTextConfig)
      htlaehText.alpha = 0.87
      htlaehText.text = "Htlaeh"
      self.view.addSubview(htlaehText)
      
      // Add the sign in / sign up button
      let signInSignUpFrame: CGRect = CGRect(x: self.width / 2 - 76, y: self.height - 56, width: 152, height: 40)
      let signInSignUpButton: Button = Button(frame: signInSignUpFrame, type: .Flat)
      signInSignUpButton.addTitle("SIGN IN / SIGN UP", color: Color().blue)
      signInSignUpButton.action = { self.digitsSignIn() }
      self.view.addSubview(signInSignUpButton)
      
      // Add the skip button
      let skipButtonFrame: CGRect = CGRect(x: self.width - 88, y: 40, width: 72, height: 40)
      let skipButton: Button = Button(frame: skipButtonFrame, type: .Flat)
      skipButton.addTitle("SKIP", color: Color().red)
      skipButton.action = { self.skipSignIn() }
      self.view.addSubview(skipButton)
      
      
   }
}

