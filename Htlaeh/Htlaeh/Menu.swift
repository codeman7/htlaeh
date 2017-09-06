//
//  Menu.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/30/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit
/// Class for side bar navigation
class Menu: UIView {
   // MARK: Properties
   /// Property for the background grey that sits behind the menu
   private lazy var backgroundGrey: BackgroundGrey = self.createBackgroundGrey()
   /// Property for the navigation bar
   private lazy var navigationBar: NavigationBar = self.createNavigationBar()
   /// Property for the icons of the buttons in the Nav Bar
   private let icons: [UIImage]
   /// Property for the labels of the buttons in the Nav Bar
   private let labels: [String]
   /// Property for the actions of the buttons
   private let actions: [()->()]
   
   // MARK: Initializers
   /**
     Default Initalizer
     - parameter Frame:   The size of the entier menu
     - parameter Icons:   The icons that will be in the Nav Bar
     - parameter Labels:  The labels for the buttons in the Nav Bar
   */
   init(frame: CGRect, icons: [UIImage], labels: [String], actions: [() -> ()]) {
      
      // Set the icons property
      self.icons = icons
      // Set the labels property
      self.labels = labels
      // Set the actions property
      self.actions = actions
      // Call the super initializer
      super.init(frame: frame)
      // Add the subviews
      self.addSubviews()
      print(self.backgroundGrey.action)
      
   }
   /// Required by Apple NEVER USE
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   // MARK: Functions
   //// Function to add all the subviews to the view
   private func addSubviews() {
      
      self.addSubview(self.backgroundGrey)
      self.addSubview(self.navigationBar)
      
   }
   
   //// This function is used to create the background grey property
   private func createBackgroundGrey() -> BackgroundGrey {
      // Set the view's frame to be the same size of the menu
      let frame: CGRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
      // Create the view
      let view: BackgroundGrey = BackgroundGrey(frame: frame)
      // Set the action for the background grey touch
      //view.action = { print("Hello World") }
      // Return the view
      return view
      
   }
   
   //// This function is used to create the navigation bar
   private func createNavigationBar() -> NavigationBar {
      
      let navigationFrame: CGRect = CGRect(x: 0, y: 0, width: 240, height: self.frame.height)
      let navigationBar: NavigationBar = NavigationBar(frame: navigationFrame, icons: self.icons, labels: self.labels)
      return navigationBar
      
   }
   
   
}

//// Make sure the menu conforms the overlay protocol
extension Menu: Overlay {
   
   /**
      Function to show the view after being hidden
      - note: Make sure view is added to heirachy before calling function
   */
   func showView() {
      
      let animation: () -> () = {
         // Show the grey
         self.backgroundGrey.alpha = self.opacity
         // Move the navigation bar into the view
         self.navigationBar.show(x: 240)
      }
      // Animate the view
      UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: animation, completion: nil)
      
      
   }
   
   /**
      Function to hide the view from the User
      - note:   This function removes the view from superview before exiting
   */
   func hideView() {
      
      let animation: () -> () = {
         // Hide the grey
         self.backgroundGrey.alpha = 0.0
         // Hide the navigation bar
         self.navigationBar.hide(x: 0)
      }
      // Animate the view and on completion remove from superview
      UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: animation, completion: { Bool in self.removeFromSuperview()})
      
   }
   
}

extension Menu {
   
   /**
      This function is to update the view when a touch occurs within its bounds
   */
   override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      // Call the super
      super.touchesMoved(touches, withEvent: event)
      // Whenever the touch moves then then call the drag action
      self.dragAction(Int(touches.first!.locationInView(self).x))
   }
   
   /**
      This function is there to update the view whenever a touch occurs within its bounds
   */
   override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
      // Call the super
      super.touchesCancelled(touches, withEvent: event)
      // Make sure the movement wasn't
      guard touches?.first != nil else {
         return
      }
      // Update the view
      self.dragFinished(Int(touches!.first!.locationInView(self).x))
   }
   
   /**
      This function is there to update the view whenever a touch occurs within its bounds
   */
   override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
      // Call the super method
      super.touchesEnded(touches, withEvent: event)
      // Update the view
      self.dragFinished(Int(touches.first!.locationInView(self).x))
   }
   
}

// MARK: Make sure the Menu conforms to draggable action
extension Menu: Draggable {
   
   var dragAction: (Int) -> () {
      return {a in
         // Update the view to the new point
         self.navigationBar.show(x: CGFloat(a - 240))
      }
   }
   
   var dragFinished: (Int) -> () {
      return { a in
         if a > 360 {
            self.showView()
         } else {
            self.hideView()
         }
      }
   }
   
}




