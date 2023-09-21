//
//  RootViewModel.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

class RootViewModel<Model: Root>: ViewModel<Model> {
  override func get() async throws {
    models = try await service.get()
  }
  
  func performancesViewModel(for model: Model) -> PerformancesViewModel<Model> {
    .init(model: model, service: service)
  }
}
