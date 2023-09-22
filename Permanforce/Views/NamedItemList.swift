//
//  NamedItemList.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

struct NamedItemList<Model: Named, VM: ViewModel<Model>, Detail: View, Destination: View>: View {
  @ObservedObject private var viewModel: VM

  private let detail: (Model) -> Detail
  private let destination: ((Model, VM) -> Destination)?

  init(
    viewModel: VM,
    @ViewBuilder detail: @escaping (Model) -> Detail,
    @ViewBuilder destination: @escaping (Model, VM) -> Destination
  ) {
    self.viewModel = viewModel
    self.detail = detail
    self.destination = destination
  }

  var body: some View {
    List {
      ForEach(viewModel.models) { model in
        let item = NamedItem(model: model, detail: detail)
        if let destination {
          NavigationLink {
            destination(model, viewModel)
          } label: {
            item
          }
        } else {
          item
        }
      }
    }
    .listStyle(PlainListStyle())
    .task {
      do {
        try await viewModel.get()
      } catch {
        print("\(error)")
      }
    }
  }
}

extension NamedItemList where Destination == Never {
  init(viewModel: VM, @ViewBuilder detail: @escaping (Model) -> Detail) {
    self.viewModel = viewModel
    self.detail = detail
    self.destination = nil
  }
}

extension NamedItemList where Detail == EmptyView {
  init(viewModel: VM, @ViewBuilder destination: @escaping (Model, VM) -> Destination) {
    self.viewModel = viewModel
    self.detail = { _ in EmptyView() }
    self.destination = destination
  }
}

extension NamedItemList where Detail == EmptyView, Destination == Never {
  init(viewModel: VM) {
    self.viewModel = viewModel
    self.detail = { _ in EmptyView() }
    self.destination = nil
  }
}
