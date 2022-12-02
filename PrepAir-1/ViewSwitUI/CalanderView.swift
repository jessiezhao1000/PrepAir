//
//  CalanderView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 12/1/22.
//

import SwiftUI

struct CalanderView: View {
    @State var currentDate: Date = Date()
    @State private var showHome = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 20){
//                HStack{
//                    Rectangle()
//                        .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
//                        .frame(width: 400, height: 450)
//
//                }
                //custome datepicker
//                .overlay(CustomDatePicker(currentDate: $currentDate))
                CustomDatePicker(currentDate: $currentDate)
          
            }
        }
        .background(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
        
       
              
        
    
    }
    
}

struct CalanderView_Previews: PreviewProvider {
    static var previews: some View {
        CalanderView()
    }
}

