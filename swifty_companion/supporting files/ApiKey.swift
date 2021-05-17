//
//  ApiKey.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 04/05/2021.
//

import Foundation

private var UID: String {
  get {
    // 1
    guard let filePath = Bundle.main.path(forResource: "42-Info", ofType: "plist") else {
      fatalError("Couldn't find file '42-Info.plist'.")
    }
    // 2
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "UID") as? String else {
      fatalError("Couldn't find key 'UID' in 'TMDB-Info.plist'.")
    }
    return value
  }
}

private var Pwd: String {
  get {
    // 1
    guard let filePath = Bundle.main.path(forResource: "42-Info", ofType: "plist") else {
      fatalError("Couldn't find file '42-Info.plist'.")
    }
    // 2
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "Pwd") as? String else {
      fatalError("Couldn't find key 'Pwd' in 'TMDB-Info.plist'.")
    }
    return value
  }
}
