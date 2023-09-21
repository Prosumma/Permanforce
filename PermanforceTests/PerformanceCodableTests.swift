//
//  PerformanceCodableTests.swift
//  PermanforceTests
//
//  Created by Greg Higley on 2023-09-20.
//

import Nimble
import XCTest

@testable import Permanforce

final class PerformanceCodableTests: XCTestCase {
  func testPerformanceCoding() throws {
    // Given
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .formatted(dateFormatter)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    let artist = Artist(id: 1, name: "Biscuits of Doom", genre: "Antarctic")
    let inperformance = Performance(id: 1, date: Date(), parent: artist)
    
    // When
    let data = try encoder.encode(inperformance)
    let outperformance = try decoder.decode(Performance<Artist>.self, from: data)
    
    // Then
    expect(inperformance.id) == outperformance.id
    expect(inperformance.name) == outperformance.name
  }
}
