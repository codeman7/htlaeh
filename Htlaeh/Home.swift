//
//  Home.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/13/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

class Home: Controller {
   var fakeWorkout: Workout {
      return self.createWorkout()
   }
   // MARK: Properties
   var statusBarHidden: Bool = false
   //var workout: Workout?
   // Property for the header
   private var header: BoldHeader?
   // Property for the scroll view
   private var scroller: Scroller?
   // Property for the menu
   private lazy var menu: Menu = self.createMenu()
   
   // MARK: Functions
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.setupViews()
      let b: Date = Date()
      let a: String = "\(b.monthAsString()) \(b.day), \(b.year)"
      print(a)
   }
   
   
   func createWorkout() -> Workout {
      
      let firstSet: WeightSet = WeightSet.createStandardSet(name: "Squat", setCount: 1, reps: 8, restTime: 75, weight: 165, date: Date().today())
      let secondSet: WeightSet = WeightSet.createStandardSet(name: "Squat", setCount: 2, reps: 8, restTime: 60, weight: 165, date: Date().today())
      let thirdSet: WeightSet = WeightSet.createStandardSet(name: "Squat", setCount: 3, reps: 8, restTime: 60, weight: 165, date: Date().today())
      let fourthSet: WeightSet = WeightSet.createStandardSet(name: "Squat", setCount: 4, reps: 5, restTime: 60, weight: 175, date: Date().today())
      let fifthSet: WeightSet = WeightSet.createStandardSet(name: "Squat", setCount: 5, reps: 2, restTime: 60, weight: 190, date: Date().today())
      let sixthSet: WeightSet = WeightSet.createStandardSet(name: "Squat", setCount: 6, reps: 2, restTime: 60, weight: 190, date: Date().today())
      let seventhSet: WeightSet = WeightSet.createStandardSet(name: "Squat", setCount: 7, reps: 1, restTime: 60, weight: 200, date: Date().today())
      let workoutArray: [WeightSet] = [firstSet, secondSet, thirdSet, fourthSet, fifthSet, sixthSet, seventhSet]
      let workout: Workout = Workout(sets: workoutArray)
      return workout
      
   }
   
   func showMore() {
      
      print("Hello World!")
      
   }
   
   func skipSet() {
      
      print("Skip this set")
      
   }
   
   func setDone() {
      
      print("This set is done")
      
   }
}


// MARK: View Setup 
extension Home: ViewSetup {
   /**
      Function to add all the views instead of using storyboards
   */
   func setupViews() {
      
      self.view.backgroundColor = Color().white
      // Add the labels
      self.addLabels()
      // Add bottom buttons
      self.addBottomButtons()
      // Set up the menu bar
      
      // Set up the header
      self.addHeader()
   }
   
   /**
      Function to add the header
   */
   private func addHeader() {
      // The headers frame
      let headerFrame: CGRect = CGRect(x: 0, y: 0, width: self.width, height: 80)
      // All the actions for the header buttons and the default settings for a home header
      let homeHeader: HomeHeader = HomeHeader(left: {self.showMenu()}, right: {self.showMore()})
      // Create the header type and set its default value
      let headerOptions: HeaderType = HeaderType.Home(homeHeader)
      // Create the header
      self.header = BoldHeader(frame: headerFrame, options: headerOptions)
      // Add the header to the VC
      self.view.addSubview(self.header!)
      
   }
   
   private func addBottomButtons() {
      
      let xL: CGFloat = self.width.halfCentered(side: .Left, size: 124)
      let leftButtonFrame: CGRect = CGRect(x: xL, y: self.height - 88, width: 124, height: 40)
      let leftButton: Button = Button(frame: leftButtonFrame, type: .Raised)
      leftButton.action = { self.skipSet() }
      leftButton.backgroundColor = Color().red
      leftButton.addTitle("SKIP", color: Color().white)
      self.view.addSubview(leftButton)
      
      
      let xR: CGFloat = self.width.halfCentered(side: .Right, size: 124)
      let rightButtonFrame: CGRect = CGRect(x: xR, y: self.height - 88, width: 124, height: 40)
      let rightButton: Button = Button(frame: rightButtonFrame, type: .Raised)
      rightButton.action = { self.setDone() }
      rightButton.backgroundColor = Color().blue
      rightButton.addTitle("DONE", color: Color().white)
      self.view.addSubview(rightButton)
      
   }
   
   private func addLabels() {
      
      let homeHint: HomeHint = HomeHint()
      let homeContent: HomeContentLabel = HomeContentLabel()
      let homeAccent: HomeAccent = HomeAccent()
      let exerciseHintFrame: CGRect = CGRect(x: self.width / 2 - 80, y: self.height / 2 - 134, width: 160, height: 19)
      let exerciseHintLabel: UILabel = UILabel(frame: exerciseHintFrame, properties: homeHint)
      exerciseHintLabel.text = "Exercise Name"
      self.view.addSubview(exerciseHintLabel)
      
      let exerciseFrame: CGRect = CGRect(x: self.width / 2 - 80, y: self.height / 2 - 107, width: 160, height: 48)
      let exerciseLabel: UILabel = UILabel(frame: exerciseFrame, properties: homeContent)
      exerciseLabel.text = "\(self.fakeWorkout.sets[0].name)"
      self.view.addSubview(exerciseLabel)
      
      let repsX: CGFloat = self.width.halfCentered(side: .Left, size: 136)
      let repsHintFrame: CGRect = CGRect(x: repsX, y: self.height / 2 - 51, width: 136, height: 19)
      let repsHint: UILabel = UILabel(frame: repsHintFrame, properties: homeHint)
      repsHint.text = "Reps"
      self.view.addSubview(repsHint)
      
      let repsFrame: CGRect = CGRect(x: repsX, y: self.height / 2 - 24, width: 136, height: 48)
      let repsLabel: UILabel = UILabel(frame: repsFrame, properties: homeContent)
      repsLabel.text = "\(self.fakeWorkout.sets[0].reps!)"
      self.view.addSubview(repsLabel)
      
      let weightX: CGFloat = self.width.halfCentered(side: .Right, size: 136)
      let weightHintFrame: CGRect = CGRect(x: weightX, y: self.height / 2 - 51, width: 136, height: 19)
      let weightHint: UILabel = UILabel(frame: weightHintFrame, properties: homeHint)
      weightHint.text = "Weight"
      self.view.addSubview(weightHint)
      
      let weightFrame: CGRect = CGRect(x: weightX, y: self.height / 2 - 24, width: 136, height: 48)
      let weightLabel: UILabel = UILabel(frame: weightFrame, properties: homeContent)
      weightLabel.text = "\(Int(self.fakeWorkout.sets[0].weight!))"
      self.view.addSubview(weightLabel)
      
      let restHintFrame: CGRect = CGRect(x: self.width / 2 - 68, y: self.height / 3 * 2 , width: 136, height: 16)
      let restHint: UILabel = UILabel(frame: restHintFrame, properties: homeHint)
      restHint.text = "Rest"
      self.view.addSubview(restHint)
      
      let restFrame: CGRect = CGRect(x: self.width / 2 - 68, y: self.height / 3 * 2 + 20, width: 136, height: 32)
      let restLabel: UILabel = UILabel(frame: restFrame, properties: homeAccent)
      restLabel.text = "\(self.fakeWorkout.sets[0].restTime!.toString())"
      self.view.addSubview(restLabel)
      
   }
   
}

// MARK: Navigation Stuff
extension Home {
   
   private func createMenu() -> Menu {
      
      let width: CGFloat = self.width + 240
      let frame: CGRect = CGRect(x: -240, y: 0, width: width, height: self.height)
      let icons: [UIImage] = [Images.Action().home, Images.Content().add, Images.Action().reorder]
      let labels: [String] = ["Home", "New Workout", "All Workouts"]
      let menu: Menu = Menu(frame: frame, icons: icons, labels: labels, actions: [])
      return menu
      
   }
   
   private func showMenu() {
      
      self.view.addSubview(menu)
      self.menu.showView()
      
   }
   
   private func hideMenu() {
      
      self.menu.hideView()
      self.menu.removeFromSuperview()
      
   }
   
}

extension Set {
   
   var name: String {
      get {
         return self.name
      }
      set(newValue) {
         self.name = newValue
      }
   }
   
}




