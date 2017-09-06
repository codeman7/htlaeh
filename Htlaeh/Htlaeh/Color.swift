//
//  Color.swift
//  Htlaeh
//
//  Created by Cody Weaver on 6/2/16.
//  Copyright © 2016 Htlaeh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
   convenience public init(hex: Int) {
      
      let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
      let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
      let blue = CGFloat((hex & 0xFF)) / 255.0
      self.init(red:red, green:green, blue:blue, alpha: 1.0)
      
   }
   
   convenience public init(hex: Int, alpha: CGFloat) {
      
      let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
      let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
      let blue = CGFloat((hex & 0xFF)) / 255.0
      self.init(red:red, green:green, blue:blue, alpha: alpha)
      
   }
   
}

struct Color {
   // Blue
   let primary = UIColor(hex: 0x2196F3)
   // Red
   let secondary = UIColor(hex: 0xF44336)
   // Green
   let third = UIColor(hex: 0x4CAF50)
   
   // Reds
   let red = UIColor(hex: 0xF44336)
   let red100 = UIColor(hex: 0xFFCDD2)
   let red200 = UIColor(hex: 0xEF9A9A)
   let red300 = UIColor(hex: 0xE57373)
   let red400 = UIColor(hex: 0xEF5350)
   let red500 = UIColor(hex: 0xF44336)
   let red600 = UIColor(hex: 0xE53935)
   let red700 = UIColor(hex: 0xD32F2F)
   let red800 = UIColor(hex: 0xC62828)
   let red900 = UIColor(hex: 0xB71C1C)
   
   // Pinks
   let pink = UIColor(hex: 0xE91E63)
   let pink100 = UIColor(hex: 0xF8BBD0)
   let pink200 = UIColor(hex: 0xF48FB1)
   let pink300 = UIColor(hex: 0xF06292)
   let pink400 = UIColor(hex: 0xEC407A)
   let pink500 = UIColor(hex: 0xE91E63)
   let pink600 = UIColor(hex: 0xD81B60)
   let pink700 = UIColor(hex: 0xC2185B)
   let pink800 = UIColor(hex: 0xAD1457)
   let pink900 = UIColor(hex: 0x880E4F)
   
   // Purples
   let purple = UIColor(hex: 0x9C27B0)
   let purple100 = UIColor(hex: 0xE1BEE7)
   let purple200 = UIColor(hex: 0xCE93D8)
   let purple300 = UIColor(hex: 0xBA68C8)
   let purple400 = UIColor(hex: 0xAB47BC)
   let purple500 = UIColor(hex: 0x9C27B0)
   let purple600 = UIColor(hex: 0x8E24AA)
   let purple700 = UIColor(hex: 0x7B1FA2)
   let purple800 = UIColor(hex: 0x6A1B9A)
   let purple900 = UIColor(hex: 0x4A148C)
   
   // Deep purples
   let deepPurple = UIColor(hex: 0x673AB7)
   let deepPurple100 = UIColor(hex: 0xD1C4E9)
   let deepPurple200 = UIColor(hex: 0xB39DDB)
   let deepPurple300 = UIColor(hex: 0x9575CD)
   let deepPurple400 = UIColor(hex: 0x7E57C2)
   let deepPurple500 = UIColor(hex: 0x673AB7)
   let deepPurple600 = UIColor(hex: 0x5E35B1)
   let deepPurple700 = UIColor(hex: 0x512DA8)
   let deepPurple800 = UIColor(hex: 0x4527A0)
   let deepPurple900 = UIColor(hex: 0x311B92)
   
   // Indigos
   let indigo = UIColor(hex: 0x3F51B5)
   let indigo100 = UIColor(hex: 0xC5CAE9)
   let indigo200 = UIColor(hex: 0x9FA8DA)
   let indigo300 = UIColor(hex: 0x7986CB)
   let indigo400 = UIColor(hex: 0x5C6BC0)
   let indigo500 = UIColor(hex: 0x3F51B5)
   let indigo600 = UIColor(hex: 0x3949AB)
   let indigo700 = UIColor(hex: 0x303F9F)
   let indigo800 = UIColor(hex: 0x283593)
   let indigo900 = UIColor(hex: 0x1A237E)
   
   // Blues
   let blue = UIColor(hex: 0x2196F3)
   let blue100 = UIColor(hex: 0xBBDEFB)
   let blue200 = UIColor(hex: 0x90CAF9)
   let blue300 = UIColor(hex: 0x64B5F6)
   let blue400 = UIColor(hex: 0x42A5F5)
   let blue500 = UIColor(hex: 0x2196F3)
   let blue600 = UIColor(hex: 0x1E88E5)
   let blue700 = UIColor(hex: 0x1976D2)
   let blue800 = UIColor(hex: 0x1565C0)
   let blue900 = UIColor(hex: 0x0D47A1)
   
   // Light blues
   let lightBlue = UIColor(hex: 0x03A9F4)
   let lightBlue100 = UIColor(hex: 0xB3E5FC)
   let lightBlue200 = UIColor(hex: 0x81D4FA)
   let lightBlue300 = UIColor(hex: 0x4FC3F7)
   let lightBlue400 = UIColor(hex: 0x29B6F6)
   let lightBlue500 = UIColor(hex: 0x03A9F4)
   let lightBlue600 = UIColor(hex: 0x039BE5)
   let lightBlue700 = UIColor(hex: 0x0288D1)
   let lightBlue800 = UIColor(hex: 0x0277BD)
   let lightBlue900 = UIColor(hex: 0x01579B)
   
   // Cyans
   let cyan = UIColor(hex: 0x00BCD4)
   let cyan100 = UIColor(hex: 0xB2EBF2)
   let cyan200 = UIColor(hex: 0x80DEEA)
   let cyan300 = UIColor(hex: 0x4DD0E1)
   let cyan400 = UIColor(hex: 0x26C6DA)
   let cyan500 = UIColor(hex: 0x00BCD4)
   let cyan600 = UIColor(hex: 0x00ACC1)
   let cyan700 = UIColor(hex: 0x0097A7)
   let cyan800 = UIColor(hex: 0x00838F)
   let cyan900 = UIColor(hex: 0x006064)
   
   // Teals
   let teal = UIColor(hex: 0x009688)
   let teal100 = UIColor(hex: 0xB2DFDB)
   let teal200 = UIColor(hex: 0x80CBC4)
   let teal300 = UIColor(hex: 0x4DB6AC)
   let teal400 = UIColor(hex: 0x26A69A)
   let teal500 = UIColor(hex: 0x009688)
   let teal600 = UIColor(hex: 0x00897B)
   let teal700 = UIColor(hex: 0x00796B)
   let teal800 = UIColor(hex: 0x00695C)
   let teal900 = UIColor(hex: 0x004D40)
   
   // Greens
   let green = UIColor(hex: 0x4CAF50)
   let green100 = UIColor(hex: 0xC8E6C9)
   let green200 = UIColor(hex: 0xA5D6A7)
   let green300 = UIColor(hex: 0x81C784)
   let green400 = UIColor(hex: 0x66BB6A)
   let green500 = UIColor(hex: 0x4CAF50)
   let green600 = UIColor(hex: 0x43A047)
   let green700 = UIColor(hex: 0x388E3C)
   let green800 = UIColor(hex: 0x2E7D32)
   let green900 = UIColor(hex: 0x1B5E20)
   
   // Light greens
   let lightGreen = UIColor(hex: 0x8BC34A)
   let lightGreen100 = UIColor(hex: 0xDCEDC8)
   let lightGreen200 = UIColor(hex: 0xC5E1A5)
   let lightGreen300 = UIColor(hex: 0xAED581)
   let lightGreen400 = UIColor(hex: 0x9CCC65)
   let lightGreen500 = UIColor(hex: 0x8BC34A)
   let lightGreen600 = UIColor(hex: 0x7CB342)
   let lightGreen700 = UIColor(hex: 0x689F38)
   let lightGreen800 = UIColor(hex: 0x558B2F)
   let lightGreen900 = UIColor(hex: 0x33691E)
   
   // Limes
   let lime = UIColor(hex: 0xCDDC39)
   let lime100 = UIColor(hex: 0xF0F4C3)
   let lime200 = UIColor(hex: 0xE6EE9C)
   let lime300 = UIColor(hex: 0xDCE775)
   let lime400 = UIColor(hex: 0xD4E157)
   let lime500 = UIColor(hex: 0xCDDC39)
   let lime600 = UIColor(hex: 0xC0CA33)
   let lime700 = UIColor(hex: 0xAFB42B)
   let lime800 = UIColor(hex: 0x9E9D24)
   let lime900 = UIColor(hex: 0x827717)
   
   // Yellows
   let yellow = UIColor(hex: 0xFFEB3B)
   let yellow100 = UIColor(hex: 0xFFF9C4)
   let yellow200 = UIColor(hex: 0xFFF59D)
   let yellow300 = UIColor(hex: 0xFFF176)
   let yellow400 = UIColor(hex: 0xFFEE58)
   let yellow500 = UIColor(hex: 0xFFEB3B)
   let yellow600 = UIColor(hex: 0xFDD835)
   let yellow700 = UIColor(hex: 0xFBC02D)
   let yellow800 = UIColor(hex: 0xF9A825)
   let yellow900 = UIColor(hex: 0xF57F17)
   
   // Ambers
   let amber = UIColor(hex: 0xFFC107)
   let amber100 = UIColor(hex: 0xFFECB3)
   let amber200 = UIColor(hex: 0xFFE082)
   let amber300 = UIColor(hex: 0xFFD54F)
   let amber400 = UIColor(hex: 0xFFCA28)
   let amber500 = UIColor(hex: 0xFFC107)
   let amber600 = UIColor(hex: 0xFFB300)
   let amber700 = UIColor(hex: 0xFFA000)
   let amber800 = UIColor(hex: 0xFF8F00)
   let amber900 = UIColor(hex: 0xFF6F00)
   
   // Oranges
   let orange = UIColor(hex: 0xFF9800)
   let orange100 = UIColor(hex: 0xFFE0B2)
   let orange200 = UIColor(hex: 0xFFCC80)
   let orange300 = UIColor(hex: 0xFFB74D)
   let orange400 = UIColor(hex: 0xFFA726)
   let orange500 = UIColor(hex: 0xFF9800)
   let orange600 = UIColor(hex: 0xFB8C00)
   let orange700 = UIColor(hex: 0xF57C00)
   let orange800 = UIColor(hex: 0xEF6C00)
   let orange900 = UIColor(hex: 0xE65100)
   
   // Deep oranges
   let deepOrange = UIColor(hex: 0xFF5722)
   let deepOrange100 = UIColor(hex: 0xFFCCBC)
   let deepOrange200 = UIColor(hex: 0xFFAB91)
   let deepOrange300 = UIColor(hex: 0xFF8A65)
   let deepOrange400 = UIColor(hex: 0xFF7043)
   let deepOrange500 = UIColor(hex: 0xFF5722)
   let deepOrange600 = UIColor(hex: 0xF4511E)
   let deepOrange700 = UIColor(hex: 0xE64A19)
   let deepOrange800 = UIColor(hex: 0xD84315)
   let deepOrange900 = UIColor(hex: 0xBF360C)
   
   // Browns
   let brown = UIColor(hex: 0x795548)
   let brown100 = UIColor(hex: 0xD7CCC8)
   let brown200 = UIColor(hex: 0xBCAAA4)
   let brown300 = UIColor(hex: 0xA1887F)
   let brown400 = UIColor(hex: 0x8D6E63)
   let brown500 = UIColor(hex: 0x795548)
   let brown600 = UIColor(hex: 0x6D4C41)
   let brown700 = UIColor(hex: 0x5D4037)
   let brown800 = UIColor(hex: 0x4E342E)
   let brown900 = UIColor(hex: 0x3E2723)
   
   // Greys
   let grey = UIColor(hex: 0x9E9E9E)
   let grey50 = UIColor(hex: 0xFAFAFA)
   let grey100 = UIColor(hex: 0xF5F5F5)
   let grey200 = UIColor(hex: 0xEEEEEE)
   let grey300 = UIColor(hex: 0xE0E0E0)
   let grey400 = UIColor(hex: 0xBDBDBD)
   let grey500 = UIColor(hex: 0x9E9E9E)
   let grey600 = UIColor(hex: 0x757575)
   let grey700 = UIColor(hex: 0x616161)
   let grey800 = UIColor(hex: 0x424242)
   let grey900 = UIColor(hex: 0x212121)
   
   // Black
   let black = UIColor(hex: 0x000000)
   
   // White
   let white = UIColor(hex: 0xFFFFFF)
   
}
