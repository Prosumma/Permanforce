//
//  NamedItem.swift
//  Permanforce
//
//  Created by Greg Higley on 2023-09-21.
//

import Foundation
import SwiftUI

struct NamedItem<Model: Named, Detail: View>: View {
  let model: Model
  private let detail: (Model) -> Detail

  init(
    model: Model,
    @ViewBuilder detail: @escaping (Model) -> Detail
  ) {
    self.model = model
    self.detail = detail
  }

  var body: some View {
    HStack {
      AsyncImage(url: model.imageUrl) { phase in
        switch phase {
        case .success(let image):
          image.resizable()
        case .empty:
          ProgressView()
        default:
          ZStack {
            Color.red
            Text("ERROR")
          }
        }
      }
      .clipShape(Circle())
      .frame(width: 50, height: 50)
      VStack(alignment: .leading) {
        Text(model.name).bold()
        detail(model)
      }
    }
  }
}

extension NamedItem where Detail == EmptyView {
  init(model: Model) {
    self.model = model
    self.detail = { _ in EmptyView() }
  }
}
