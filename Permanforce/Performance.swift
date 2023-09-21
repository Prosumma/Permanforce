//
//  Performance.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

struct Performance<Parent: Named & Codable> {
  let id: Int
  let date: Date
  let parent: Parent
}

extension Performance: Named {
  static var entityName: String {
    Parent.entityName
  }
  
  var name: String {
    parent.name
  }

  var imageUrl: URL? {
    parent.imageUrl
  }
}

extension Performance: Codable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: DynamicCodingKey.self)
    id = try container.decode(Int.self, forKey: .id)
    date = try container.decode(Date.self, forKey: .date)
    parent = try container.decode(Parent.self, forKey: Parent.codingKey)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: DynamicCodingKey.self)
    try container.encode(id, forKey: .id)
    try container.encode(date, forKey: .date)
    try container.encode(parent, forKey: Parent.codingKey)
  }
}
