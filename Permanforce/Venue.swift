//
//  Venue.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

struct Venue: Codable, Named {
  let id: Int
  let name: String
  let sortId: Int
}

extension Venue: ParentModel {
  static let entityName: String = "venue"
}
