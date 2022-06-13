//
//  TextLayout.swift
//  TextKit
//
//  Created by WeZZard on 6/13/22.
//

import SwiftUI

internal struct TextLayout: Layout {
  
  internal let environment: TextEnvironment
  
  internal init(environment: TextEnvironment) {
    self.environment = environment
  }
  
  internal func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Cache
  ) -> CGSize {
    fatalError()
  }
  
  internal func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Cache
  ) {
    fatalError()
  }
  
  internal func makeCache(subviews: Subviews) -> Cache {
    return Cache(environment: environment)
  }
  
  internal class Cache {
    
    internal unowned let environment: TextEnvironment
    
    internal let layoutManager: NSLayoutManager
    
    internal var containers: [NSTextContainer]
    
    internal init(environment: TextEnvironment) {
      self.environment = environment
      self.layoutManager = NSLayoutManager()
      self.containers = []
    }
    
  }
  
}
