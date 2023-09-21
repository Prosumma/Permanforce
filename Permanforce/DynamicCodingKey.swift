//
//  DynamicCodingKey.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

struct DynamicCodingKey: CodingKey {
  private(set) var stringValue: String
  
  init?(stringValue: String) {
    self.stringValue = stringValue
  }
  
  private(set) var intValue: Int?
  
  init?(intValue: Int) {
    return nil
  }
}

extension DynamicCodingKey: ExpressibleByStringLiteral {
  init(stringLiteral value: String) {
    stringValue = value
  }
}

extension DynamicCodingKey {
  static let id: DynamicCodingKey = "id"
  static let date: DynamicCodingKey = "date"
}
