//
//  ArtistView.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

struct ArtistView: View {
  @EnvironmentObject private var appViewModel: AppViewModel
  
  private let dateFormatter = DateFormatter()
  
  init() {
    dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
  }
  
  var body: some View {
    NamedItemList(viewModel: appViewModel.rootViewModel(for: Artist.self)) { artist in
      Text(artist.genre).italic()
    } destination: { artist, viewModel in
      NamedItemList(viewModel: viewModel.performancesViewModel(for: artist)) { performance in
        Text(dateFormatter.string(from: performance.date))
      }.navigationTitle(artist.name)
    }
  }
}
