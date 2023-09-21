//
//  Named.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

protocol Named: Codable, Identifiable, Equatable, Comparable {
  static var entityName: String { get }
  var name: String { get }
  var imageUrl: URL? { get }
}

extension Named {
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
  }

  static func < (lhs: Self, rhs: Self) -> Bool {
    lhs.name < rhs.name
  }
  
  static var entityPath: String {
    entityName + "s"
  }
  
  var imageUrl: URL? {
    name
      .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
      .flatMap {
        "https://songleap.s3.amazonaws.com/\(Self.entityPath)/\($0).png"
      }
      .flatMap(URL.init)
  }
}

