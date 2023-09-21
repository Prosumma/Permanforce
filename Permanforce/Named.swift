//
//  Named.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Foundation

protocol Named {
  var name: String { get }
  var imageUrl: URL? { get }
}

extension Named where Self: ParentModel {
  var imageUrl: URL? {
    name
      .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
      .flatMap {
        "https://songleap.s3.amazonaws.com/\(Self.entityPath)/\($0).png"
      }
      .flatMap(URL.init)
  }
}
