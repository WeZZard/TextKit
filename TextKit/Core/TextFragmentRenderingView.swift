//
//  TextFragmentRenderingView.swift
//  TextKit
//
//  Created by WeZZard on 6/13/22.
//

import SwiftUI

internal struct TextFragmentRenderingView: View {
  
#if os(iOS)
  private struct PlatformTextFragmentRenderingView: UIViewRepresentable {
    
    class SystemTextFragmentRenderingView: UIView {
      
    }
    
    typealias UIViewType = SystemTextFragmentRenderingView
    
    func makeUIView(context: Context) -> UIViewType {
      SystemTextFragmentRenderingView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
      
    }
    
  }
#endif
  
  private struct DelegatedTextFragmentRenderingView: View {
    
    let environment: TextFragmentEnvironment
    
    var body: some View {
      EmptyView()
    }
    
  }
  
  @Environment(\.textFragmentEnvironment)
  internal var environment: TextFragmentEnvironment?
  
  internal var body: some View {
    if let environment = environment {
      DelegatedTextFragmentRenderingView(environment: environment)
    } else {
      PlatformTextFragmentRenderingView()
    }
  }
  
}
