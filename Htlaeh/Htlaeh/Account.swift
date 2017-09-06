//
//  Account.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/3/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation

enum AccountStep {
   case Start
   case Email
   case Password
   case Submit
   
   mutating func next() {
      switch self {
      case .Start:
         self = .Email
      case .Email:
         self = .Password
      default:
         self = .Submit
      }
   }
   
   mutating func back() {
      switch self {
      case .Submit:
         self = .Password
      case .Password:
         self = .Email
      default:
         self = .Start
      }
   }
}


// Errors for Account type
enum AccountErrors {
   enum Email: String {
      case emptyEmail = "Please enter an email"
      case notEmail = "Not a valid email"
   }
   enum Password: String {
      case passwordToShort = "Password must be atleast 8 characters"
      case noNumberPassword = "Password must contain a number"
      case noLetterPassword = "Password must contain a letter"
      case containsSpaces = "No spaces allowed"
   }
}

struct Account {
   // MARK: Properties
   let email: String
   let password: String
   
   // MARK: Inializers
   // Default inializers
   init() {
      self.email = ""
      self.password = ""
   }
   
   init(email: String) {
      self.email = email
      self.password = ""
   }
   
   init(email: String, password: String) {
      self.email = email
      self.password = password
   }
   
   // MARK: Functions
   func updateEmail(newEmail: String) -> Account {
      let newAccount: Account = Account(email: newEmail)
      return newAccount
   }
   
   func updatePassword(newPassword: String) -> Account {
      // Make sure email isn't nil if so return blank account
      guard self.email != "" else {
         return Account()
      }
      let newAccount: Account = Account(email: email, password: newPassword)
      return newAccount
   }
   
   // Function to check email and throws email errors
   func validateEmail() -> AccountErrors.Email? {
      var valid: AccountErrors.Email? = self.blankEmail()
      guard valid == nil else {
         return valid
      }
      valid = self.emailCheck()
      guard valid == nil else {
         return valid
      }
      return nil
   }
   
   // Function to check password and throws password errors
   func validatePassword() -> AccountErrors.Password? {
      var valid: AccountErrors.Password? = self.passwordLength()
      guard valid == nil else { return valid }
      valid = self.passwordLetterCheck()
      guard valid == nil else { return valid }
      valid = self.passwordNumberCheck()
      guard valid == nil else { return valid }
      valid = self.passwordWhiteSpaceCheck()
      guard valid == nil else { return valid }
      return nil
   }
   
   
   // MARK: Email checks
   // Make sure email isn't blank
   private func blankEmail() -> AccountErrors.Email? {
      guard self.email != "" else {
         return AccountErrors.Email.emptyEmail
      }
      return nil
   }
   
   // Make sure real email
   private func emailCheck() -> AccountErrors.Email? {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
      let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      guard emailTest.evaluateWithObject(self.email) != false else {
         return AccountErrors.Email.notEmail
      }
      return nil
   }
   
   // MARK: Password Checks
   // Make sure password is atleast 8 characters
   private func passwordLength() -> AccountErrors.Password? {
      let passLength = self.password.characters.count
      guard passLength > 7 else {
         return AccountErrors.Password.passwordToShort
      }
      return nil
   }
   
   // Make sure password contains atleast 1 letter
   private func passwordLetterCheck() -> AccountErrors.Password? {
      let passAsInt = Int(self.password)
      guard passAsInt == nil else {
         return AccountErrors.Password.noLetterPassword
      }
      return nil
   }
   
   // Make sure password contains atleast 1 number
   private func passwordNumberCheck() -> AccountErrors.Password? {
      let decimalCharacters = NSCharacterSet.decimalDigitCharacterSet()
      let decimalRange = self.password.rangeOfCharacterFromSet(decimalCharacters)
      guard decimalRange != nil else {
         return AccountErrors.Password.noNumberPassword
      }
      return nil
   }
   
   // Make sure no white space
   private func passwordWhiteSpaceCheck() -> AccountErrors.Password? {
      let whiteSpace = NSCharacterSet.whitespaceCharacterSet()
      let range = self.password.rangeOfCharacterFromSet(whiteSpace)
      guard range == nil else {
         return AccountErrors.Password.containsSpaces
      }
      return nil
   }
}
