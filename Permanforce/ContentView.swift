//
//  ContentView.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-20.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var appViewModel: AppViewModel
  
  private let dateFormatter = DateFormatter()
  
  init() {
    dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
  }
  
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink {
          ArtistView().navigationTitle("Artists")
        } label: {
          RootSelector(label: "Artists")
        }.frame(maxHeight: .infinity)
        NavigationLink {
          VenueView().navigationTitle("Venues")
        } label: {
          RootSelector(label: "Venues")
        }.frame(maxHeight: .infinity)
      }
    }
  }
}

private struct RootSelector: View {
  private let label: String
  
  init(label: String) {
    self.label = label
  }
  
  var body: some View {
    Text(label).font(.largeTitle)
  }
}
