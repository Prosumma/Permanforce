//
//  Named.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

protocol Named {
  static var entityName: String { get }
  var name: String { get }
  var imageUrl: URL? { get }
}

extension Named {
  static var entityPath: String {
    entityName + "s"
  }
  
  static var codingKey: DynamicCodingKey {
    .init(stringValue: entityName)!
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
