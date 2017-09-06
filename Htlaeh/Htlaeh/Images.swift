//
//  File.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
   enum AssetIdentifier: String {
      
      case Account = "Account"
      case Add = "Add"
      case Back = "Back"
      case Check = "Check"
      case Close = "Close"
      case Cloud = "Cloud"
      case Devices = "Devices"
      case Free = "Free"
      case Home = "Home"
      case Logo = "Logo"
      case LogoSmooth = "LogoSmooth"
      case Menu = "Menu"
      case More = "More"
      case Reorder = "Reorder"
      case WordLogo = "WordLogo"
      
   }
   
   convenience init!(assetIdentifier: AssetIdentifier) {
      self.init(named: assetIdentifier.rawValue)
   }
}


struct Images {
   
   struct Action {
      
      let account: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Account)
      let home: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Home)
      let reorder: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Reorder)
      
   }
   
   struct Content {
      
      let add: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Add)
      
   }
   
   struct Editor {
      
      let free: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Free)
      
   }
   
   struct File {
      
      let cloud: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Cloud)
      
   }
   
   struct Hardware {
      
      let devices: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Devices)
      
   }
   
   struct Htlaeh {
      
      let logo: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Logo)
      let logoSmooth: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.LogoSmooth)
      let wordLogo: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.WordLogo)
      
   }
   
   struct Navigation {
      
      let back: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Back)
      let check: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Check)
      let close: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Close)
      let menu: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.Menu)
      let more: UIImage = UIImage(assetIdentifier: UIImage.AssetIdentifier.More)
      
   }
}