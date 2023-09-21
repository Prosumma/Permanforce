//
//  AppAssembly.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import Guise

class AppAssembly: Assembly {
  func register(in registrar: Registrar) {
    registrar.register(
      APIService.self,
      lifetime: .singleton,
      factory: auto(ConcreteAPIService.init)
    )
  }
}
