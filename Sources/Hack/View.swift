//
//  ViewExtension.swift
//  
//
//  Created by Brian Seo on 2023-04-17.
//

import SwiftUI

@available(macOS 10.15, *)
public extension View {
    // Have views side by side
    static func + <T> (lhs: Self, rhs: T) -> some View where T: View {
        HStack {
            lhs
            rhs
        }
    }
    
    // set a square frame size for a view
    @ViewBuilder
    func frame(_ length: CGFloat) -> some View {
        self.frame(width: length, height: length)
    }
    
    // set a max frame
    @ViewBuilder
    func frame(max length: CGFloat) -> some View {
        self.frame(maxWidth: length, maxHeight: length)
    }
}

// spacing constants
public extension CGFloat {
    static let xxs: CGFloat = 2.0
    static let xs: CGFloat = 4.0
    static let s: CGFloat = 8.0
    static let m: CGFloat = 16.0
    static let l: CGFloat = 24.0
    static let xl: CGFloat = 36.0
    static let xxl: CGFloat = 48.0
}

// animates test values
@available(macOS 10.15, *)
public extension Text {
    func transition(_ t: AnyTransition, value: String) -> some View {
        return self.transition(t).id("_t\(value)")
    }
}


