//
//  VenueView.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

struct VenueView: View {
  @EnvironmentObject private var appViewModel: AppViewModel

  private let dateFormatter = DateFormatter()

  init() {
    dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
  }

  var body: some View {
    NamedItemList(viewModel: appViewModel.rootViewModel(for: Venue.self)) { venue, viewModel in
      NamedItemList(viewModel: viewModel.performancesViewModel(for: venue)) { performance in
        Text(dateFormatter.string(from: performance.date))
      }.navigationTitle(venue.name)
    }
  }
}
