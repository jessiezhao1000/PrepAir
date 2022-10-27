//
//  RootView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/29/22.
//

import SwiftUI

struct RootView: View {
    @State var press = false
    @State var back = false
    @State var show = false
    var body: some View {
        NavigationView{
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
            if show{
                MapView()
            }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
