//
//  TextFragmentEnvironment.swift
//  TextKit
//
//  Created by WeZZard on 6/13/22.
//

import SwiftUI

internal protocol TextFragmentEnvironment: AnyObject {
  
}

extension EnvironmentValues {
  
  @inline(__always)
  internal var textFragmentEnvironment: TextFragmentEnvironment? {
    get {
      self[TextFragmentEnvironmentKey.self]
    }
    set {
      self[TextFragmentEnvironmentKey.self] = newValue
    }
  }
  
}

private struct TextFragmentEnvironmentKey: EnvironmentKey {
  
  typealias Value = TextFragmentEnvironment?
  
  @inline(__always)
  static var defaultValue: Value { nil }
  
}
