//
//  PermanforceApp.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import Guise
import SwiftUI

@main
struct PermanforceApp: App {
  let container = Container()
  let service: APIService

  init() {
    container.assemble(AppAssembly())
    service = try! container.resolve()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(AppViewModel(service: service))
    }
  }
}
