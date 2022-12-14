//
//  TrackableScrollView.swift
//  PrepAir-1
//
//  Created by Yiwen Zhao on 11/30/22.
//

import SwiftUI

struct TrackableScrollView<Content:View>: View {
    let axes: Axis.Set
    let offsetChanged: (CGPoint) -> Void
    let content: Content
    
    init(axes: Axis.Set = .vertical, offsetChanged: @escaping (CGPoint) -> Void = { _ in}, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self.offsetChanged = offsetChanged
        self.content = content()
    }
    
    var body: some View {
        SwiftUI.ScrollView(axes, showsIndicators: false) {
            GeometryReader { geometry in
                Color.clear.preference(key: ScrollOffsetPreferenceKey1.self, value: geometry.frame(in: .named("scrollView")).origin)
            }
            .frame(width: 0, height: 0)
            content
        }
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ScrollOffsetPreferenceKey1.self, perform: offsetChanged)
    }
}

private struct ScrollOffsetPreferenceKey1 : PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue:() -> CGPoint) {}
}
