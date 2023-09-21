//
//  VenuesView.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

struct VenuesView: View {
  @EnvironmentObject private var appViewModel: AppViewModel
  @Environment(\.dateFormatter) private var dateFormatter: DateFormatter

  var body: some View {
    NamedItemList(viewModel: appViewModel.rootViewModel(for: Venue.self)) { venue, viewModel in
      NamedItemList(viewModel: viewModel.performancesViewModel(for: venue)) { performance in
        Text(dateFormatter.string(from: performance.date))
      }.navigationTitle(venue.name)
    }
  }
}
