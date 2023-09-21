//
//  AppViewModel.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

@MainActor
class AppViewModel: ObservableObject {
  private let service: APIService
  
  init(service: APIService) {
    self.service = service
  }
  
  func rootViewModel<Model: Named & Identifiable & Codable>(for type: Model.Type = Model.self) -> RootViewModel<Model> {
    .init(service: service)
  }
}
