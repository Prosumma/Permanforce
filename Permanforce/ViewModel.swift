//
//  ViewModel.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

class ViewModel<Model>: ObservableObject {
  let service: APIService
  @Published var models: [Model] = []
  
  init(service: APIService) {
    self.service = service
  }
  
  func get() async throws {}
}
