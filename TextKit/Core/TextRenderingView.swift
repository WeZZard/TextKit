//
//  TextRenderingView.swift
//  TextKit
//
//  Created by WeZZard on 6/13/22.
//

import SwiftUI

internal struct TextRenderingView<Content: View>: View {
  
  internal let environment: TextEnvironment
  
  internal let content: Content
  
  internal var body: some View {
    TextLayout(environment: environment) {
      content
    }
  }
  
}
