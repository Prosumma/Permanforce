//
//  Root.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation

protocol Root: Named {
  associatedtype Alternate: Root
}

extension Root {
  static var codingKey: DynamicCodingKey {
    .init(stringValue: entityName)!
  }
}
