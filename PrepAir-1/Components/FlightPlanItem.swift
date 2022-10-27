//
//  FlightPlanItem.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/31/22.
//

import SwiftUI

struct FlightPlanItem: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            //Rectangle 5
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(#colorLiteral(red: 0.9416666626930237, green: 0.9416666626930237, blue: 0.9416666626930237, alpha: 1))).matchedGeometryEffect(id: "card", in: namespace)
                .frame(width: 196, height: 218)
                //.matchedGeometryEffect(id: "frame", in: namespace)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 10, x: 0, y: 4)
                .matchedGeometryEffect(id: "rectangle", in: namespace)
            
            VStack (alignment: .leading) {
                //ATL -> LAX
                Text("ATL -> LAX")
                    .font(.title.bold())
                    //.matchedGeometryEffect(id: "ATL LAX-font", in: namespace)
                    //.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                    .offset(y: -20)
                    .padding(.leading, 10)
                    .matchedGeometryEffect(id: "ATL LAX", in: namespace)
                    
                //June 17th
                Text("June 17th")
                    .font(.body)
                    //.fontWeight(.)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                    .offset(y: -20)
                    .padding(.leading, 10)
                
                HStack(alignment: .firstTextBaseline) {
                    Text("1")
                        .font(.system(size: 64))
                        .offset(y: 30)
                        //.padding(.leading, 10)
                    Text("hr")
                        .font(.system(size: 20))
                        .offset(y: 30)
                    Text("25")
                        .font(.system(size: 64))
                        .offset(y: 30)
                    Text("mins")
                        .font(.system(size: 20))
                        .offset(y: 30)
                }
               
            }

        } .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
        
        /*
        Text("ATL -> LAX")
            .matchedGeometryEffect(id: "HomeView", in: namespace)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
         */
    }
}

struct FlightPlanItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        FlightPlanItem(namespace: namespace, show: .constant(true))
    }
}
