//
//  Binding.swift
//  Berloga
//
//  Created by Kostanovsky Andrey on 23.04.2023.
//

import Foundation

class Binding<T> {
  typealias Listener = (T) -> Void

  var value: T {
    didSet {
      listener?(value)
    }
  }
  private var listener: Listener?

  init(_ value: T) {
    self.value = value
  }

  func bind(_ listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
