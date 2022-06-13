//
//  TextEnvironment.swift
//  TextKit
//
//  Created by WeZZard on 6/13/22.
//

import SwiftUI

internal class TextEnvironment: TextFragmentEnvironment {
  
  internal var textProperties: EnvironmentalTextProperties
  
  internal init(textProperties: EnvironmentalTextProperties) {
    self.textProperties = textProperties
  }
  
}

internal struct WithTextEnvironment<Content: View>: View {
  
  @State
  private var environment: TextEnvironment?
  
  internal let content: (TextEnvironment) -> Content
  
  internal init(@ViewBuilder content: @escaping (TextEnvironment) -> Content) {
    self.content = content
  }
  
  internal var body: some View {
    EnvironmentalTextProperties.Key._delay { value in
      value._force { value -> Content in
        if let environment = environment {
          environment.textProperties = value
          return content(environment)
        } else {
          let environment = TextEnvironment(textProperties: value)
          self.environment = environment
          return content(environment)
        }
      }
      .background {
        TextEnvironmentReadingView()
          .hidden()
      }
    }
  }
  
}

internal struct EnvironmentalTextProperties {
  
  internal mutating func merge(with another: EnvironmentalTextProperties) {
    fatalError()
  }
  
  internal struct Key: PreferenceKey {
    
    internal typealias Value = EnvironmentalTextProperties
    
    internal static var defaultValue: Value {
      EnvironmentalTextProperties()
    }
    
    internal static func reduce(value: inout Value, nextValue: () -> Value) {
      value.merge(with: nextValue())
    }
    
  }
  
}

private struct TextEnvironmentReadingView: View {
  
#if os(iOS) || os(tvOS)
  private struct PlatformTextEnvironmentReadingView: UIViewRepresentable {
    
    class SystemTextEnvironmentReadingView: UIView {
      
    }
    
    typealias UIViewType = SystemTextEnvironmentReadingView
    
    func makeUIView(context: Context) -> UIViewType {
      SystemTextEnvironmentReadingView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
      
    }
    
  }
#elseif os(macOS)
  private struct PlatformTextEnvironmentReadingView: NSViewRepresentable {
    
    class SystemTextEnvironmentReadingView: NSView {
      
    }
    
    typealias NSViewType = SystemTextEnvironmentReadingView
    
    func makeNSView(context: Context) -> NSViewType {
      SystemTextEnvironmentReadingView()
    }
    
    func updateNSView(_ uiView: NSViewType, context: Context) {
      
    }
    
  }
#elseif os(watchOS)
  private struct PlatformTextEnvironmentReadingView: WKInterfaceObjectRepresentable {
    
    class SystemTextEnvironmentReadingObject: WKInterfaceObject {
      
    }
    
    typealias WKInterfaceObjectType = SystemTextEnvironmentReadingObject
    
    func makeWKInterfaceObject(context: Context) -> WKInterfaceObjectType {
      SystemTextEnvironmentReadingObject()
    }
    
    func updateWKInterfaceObject(_ uiView: WKInterfaceObjectType, context: Context) {
      
    }
    
  }
#endif
  
  var body: some View {
    PlatformTextEnvironmentReadingView()
  }
  
}

