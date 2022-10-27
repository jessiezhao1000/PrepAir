//
//  RootView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/29/22.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        
            VStack {
                Spacer()
                ZStack {
                    Image("tab bar")
                    HStack(alignment: .bottom, spacing: 75) {
                        Image("flight takeoff")
                        Image("Map")
                        Image("Vector-1")
                    }.offset(y : -7)
                }
            }.ignoresSafeArea()
        
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
