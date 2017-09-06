//
//  WorkoutCard.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/17/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

/**
   Use this struct to initalize any card
 */
struct WorkoutCardInit {
   let exercise: String
   let reps: Int?
   let weight: Double?
   let restTime: Double?
}

/**
   Make the struct conform the the View Model CardStyle
 */
extension WorkoutCardInit: WorkoutCardStyles {}

/**
   Use this class to create a workout card
 */

class WorkoutCard: Card {
   
   // MARK: Properties
   var restTime: Double?
   // MARK: Intializers
   /// Default initalizers
   init(frame: CGRect, data: WorkoutCardInit) {
      
      self.restTime = data.restTime
      super.init(frame: frame)
      self.addHintText(data)
      self.addInfo(data)
      self.addIcons(data)
      
   }
   
   /// Required By Apple
   required init?(coder aDecoder: NSCoder) {
      
      fatalError("This class does not support NSCoding")
      
   }
   
   // MARK: Functions
   // MARK: Hint Functions
   /**
      Function to add all the hint text
      - parameter styles: Takes anything that conforms to the Workout Card Style VM
   */
   private func addHintText<A: WorkoutCardStyles>(style: A) {
      
      self.addExerciseHint(style)
      self.addRepsHint(style)
      self.addWeightHint(style)
      
   }
   
   private func addExerciseHint<A: WorkoutCardStyles>(style: A) {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2 - 60, y: 24, width: 120, height: 16)
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: style.hintFont, alignment: style.alignment, color: Color().black)
      let exerciseHint: UILabel = UILabel(config: labelConfig)
      exerciseHint.text = "Exercise"
      exerciseHint.alpha = style.hintTextAlpha
      self.addSubview(exerciseHint)
      
   }
   
   private func addRepsHint<A: WorkoutCardStyles>(style: A) {
      
      let frame: CGRect = CGRect(x: 8, y: self.frame.height / 2 - 24, width: self.frame.width / 2 - 16, height: 16)
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: style.hintFont, alignment: style.alignment, color: Color().black)
      let hint: UILabel = UILabel(config: labelConfig)
      hint.text = "Reps"
      hint.alpha = style.hintTextAlpha
      self.addSubview(hint)
      
   }
   
   
   private func addWeightHint<A: WorkoutCardStyles>(style: A) {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2 + 8, y: self.frame.height / 2 - 24, width: self.frame.width / 2 - 16, height: 16)
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: style.hintFont, alignment: style.alignment, color: Color().black)
      let hint: UILabel = UILabel(config: labelConfig)
      hint.text = "Weight"
      hint.alpha = style.hintTextAlpha
      self.addSubview(hint)
      
   }
   
   // MARK: Information functions
   private func addInfo(style: WorkoutCardInit) {
      
      self.addExercise(style)
      self.addReps(style)
      self.addWeight(style)
      
   }
   
   private func addExercise(style: WorkoutCardInit) {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2 - 90, y: 48, width: 180, height: 32)
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: style.infoFont, alignment: style.alignment, color: Color().black)
      let label: UILabel = UILabel(config: labelConfig)
      label.text = style.exercise
      label.alpha = style.infoTextAlpha
      self.addSubview(label)
      
   }
   
   private func addReps(style: WorkoutCardInit) {
      
      let frame: CGRect = CGRect(x: 8, y: self.frame.height / 2, width: self.frame.width / 2 - 16, height: 32)
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: style.infoFont, alignment: style.alignment, color: Color().black)
      let label: UILabel = UILabel(config: labelConfig)
      let reps = style.reps ?? 0
      label.text = "\(reps)"
      label.alpha = style.infoTextAlpha
      self.addSubview(label)
      
   }
   
   private func addWeight(style: WorkoutCardInit) {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2 + 8, y: self.frame.height / 2, width: self.frame.width / 2 - 16, height: 32)
      let labelConfig: LabelConfig = LabelConfig(frame: frame, font: style.infoFont, alignment: style.alignment, color: Color().black)
      let label: UILabel = UILabel(config: labelConfig)
      let weight = style.weight ?? 0
      label.text = "\(weight)"
      label.alpha = style.infoTextAlpha
      self.addSubview(label)
      
   }
   
   // MARK: Icon functions
   /**
      Use this function to add the icons to the cards
      - parameter style:   Should conform to the WorkoutCardStyle protocol
      - info:  If the style changes it should change for all cards to update the protocol
   */
   func addIcons<A: WorkoutCardStyles>(style: A) {
      // Call both the functions to add the icons to the card
      self.addLeftIcon(style)
      self.addRightIcon(style)
      
   }
   
   // TODO: Add actions to the button
   private func addLeftIcon<A: WorkoutCardStyles>(style: A) {
      
      let frame: CGRect = CGRect(x: 16, y: self.frame.height - 62, width: self.frame.width / 2 - 32, height: 46)
      let button: Button = Button(frame: frame, type: .Flat)
      button.addIcon(style.leftImage, color: style.leftIconColor)
      self.addSubview(button)
      
   }
   
   // TODO: Add action to the button
   private func addRightIcon<A: WorkoutCardStyles>(style: A) {
      
      let frame: CGRect = CGRect(x: self.frame.width / 2 + 16, y: self.frame.height - 62, width: self.frame.width / 2 - 32, height: 46)
      let button: Button = Button(frame: frame, type: .Flat)
      button.addIcon(style.rightImage, color: style.rightIconColor)
      self.addSubview(button)
      
   }
   
}




