//
//  TextSpace.swift
//  TextKit
//
//  Created by WeZZard on 6/13/22.
//

import SwiftUI

@propertyWrapper
public struct TextSpace: DynamicProperty {
  
  public var wrappedValue: ID {
    fatalError()
  }
  
  public init() {
    fatalError()
  }
  
  public struct ID: Hashable, Equatable {
    
  }
  
}
