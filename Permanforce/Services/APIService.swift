//
//  APIService.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import HTTPFluent

protocol APIService {
  func get<Model: Named & Codable>() async throws -> [Model]
  func getPerformances<Model: Root>(for model: Model) async throws -> [Performance<Model.Alternate>]
}

class ConcreteAPIService: APIService {
  private let decoder: JSONDecoder
  // In a real application, we wouldn't hard-code this.
  private let client = URLClient(url: "http://ec2-44-211-66-223.compute-1.amazonaws.com")
  private let dayFormatter = DateFormatter()
  private let calendar = Calendar(identifier: .gregorian)

  init() {
    dayFormatter.dateFormat = "yyyy-MM-dd"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
  }
  
  func get<Model: Named & Codable>() async throws -> [Model] {
    try await client
      .path(Model.entityPath)
      .receive(decoding: [Model].self, decoder: decoder)
  }
  
  func getPerformances<Model: Root>(for model: Model) async throws -> [Performance<Model.Alternate>] {
    let start = Date()
    let from = dayFormatter.string(from: start)
    let end = calendar.date(byAdding: .day, value: 14, to: start)!
    let to = dayFormatter.string(from: end)
    return try await client
      .path(Model.entityPath, model.id, "performances")
      .query(from, forName: "from")
      .query(to, forName: "to")
      .receive(decoding: [Performance<Model.Alternate>].self, decoder: decoder)
  }
}
