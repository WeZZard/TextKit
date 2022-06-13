//
//  TextView.swift
//  TextKit
//
//  Created by WeZZard on 6/13/22.
//

import SwiftUI

public struct TextView<Content: View>: View {
  
  public let textSpace: TextSpace?
  
  public let content: Content
  
  @inlinable
  public init(textSpace: TextSpace? = nil, @ViewBuilder content: () -> Content) {
    self.textSpace = textSpace
    self.content = content()
  }
  
  public var body: some View {
    WithTextEnvironment { environment in
      TextRenderingView(
        environment: environment,
        content: content
      ).environment(\.textFragmentEnvironment, environment)
    }
  }
  
}

extension TextView where Content == TextFragment {
  
  public init(textSpace: TextSpace? = nil, string: String) {
    self.init(textSpace: textSpace) {
      TextFragment(string: string)
    }
  }
  
  public init(textSpace: TextSpace? = nil, attributedString: AttributedString) {
    self.init(textSpace: textSpace) {
      TextFragment(attributedString: attributedString)
    }
  }
  
}
