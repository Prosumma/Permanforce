//
//  DateFormatter.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

enum DateFormatterKey: EnvironmentKey {
  static private(set) var defaultValue: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
    return dateFormatter
  }()
}

extension EnvironmentValues {
  var dateFormatter: DateFormatter {
    get { self[DateFormatterKey.self] }
    set { self[DateFormatterKey.self] = newValue }
  }
}
