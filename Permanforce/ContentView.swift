//
//  ContentView.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var appViewModel: AppViewModel
  
  var body: some View {
    NavigationView {
      NamedItemList(viewModel: appViewModel.rootViewModel(for: Artist.self)) { artist in
        Text(artist.genre).italic()
      } destination: { artist, viewModel in
        NamedItemList(viewModel: viewModel.performancesViewModel(for: artist))
      }
    }
  }
}
