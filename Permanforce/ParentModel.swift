//
//  ParentModel.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

protocol ParentModel {
  static var entityName: String { get }
}

extension ParentModel {
  static var entityPath: String {
    entityName + "s"
  }
  
  static var codingKey: DynamicCodingKey {
    .init(stringValue: entityName)!
  }
}
