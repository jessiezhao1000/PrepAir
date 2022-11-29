//
//  ProfileHeaderView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 11/17/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State var text = ""

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
            .frame(width: 400, height: 260)
            
            VStack {
                Image("Vector-1").resizable().scaledToFit()
                    .padding([.leading, .top])
                    .frame(width: 100,height: 100, alignment: .center)
                   
                
                
                    /*
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .frame(width: 247, height: 40)
                        .padding([.leading])
                     */
                    Text("Yiqian Zhao")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding([.bottom])
                        
                        
                    //Rectangle 4
                
                    
            }
          
            
        }
    }
}
    


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
