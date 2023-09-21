//
//  Venue.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

struct Venue: Codable, Identifiable {
  let id: Int
  let name: String
  let sortId: Int
}

extension Venue {
  static func < (lhs: Venue, rhs: Venue) -> Bool {
    lhs.sortId < rhs.sortId
  }
}

extension Venue: Root {
  typealias Alternate = Artist
  static let entityName: String = "venue"
}
