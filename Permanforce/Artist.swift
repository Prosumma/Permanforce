//
//  Artist.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

struct Artist: Codable, Identifiable {
  let id: Int
  let name: String
  let genre: String
}

extension Artist: Root {
  typealias Alternate = Venue
  static let entityName: String = "artist"
}
