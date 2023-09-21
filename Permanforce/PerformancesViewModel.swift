//
//  PerformancesViewModel.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

class PerformancesViewModel<Model: Root>: ViewModel<Performance<Model.Alternate>> {
  let model: Model
  
  init(model: Model, service: APIService) {
    self.model = model
    super.init(service: service)
  }
  
  override func get() async throws {
    models = try await service.getPerformances(for: model)
  }
}
