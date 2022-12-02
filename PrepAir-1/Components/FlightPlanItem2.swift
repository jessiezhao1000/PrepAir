//
//  FlightPlanItem.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/31/22.
//

import SwiftUI

struct FlightPlanItem2: View {
    //var namespace: Namespace.ID
    //@Binding var show: Bool
    
    var body: some View {
        ZStack {
            //Rectangle 5
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(#colorLiteral(red: 0.9416666626930237, green: 0.9416666626930237, blue: 0.9416666626930237, alpha: 1)))//.matchedGeometryEffect(id: "card", in: namespace)
                .frame(width: 196, height: 218)
                //.matchedGeometryEffect(id: "frame", in: namespace)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 10, x: 0, y: 4)
                //.matchedGeometryEffect(id: "rectangle", in: namespace)
            
            VStack (alignment: .leading) {
                //ATL -> LAX
                Text("LAX -> ATL")
                    .font(.title.bold())
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                    //.matchedGeometryEffect(id: "ATL LAX-font", in: namespace)
                    //.foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                    .offset(y: -20)
                    .padding(.leading, 10)
                    //.matchedGeometryEffect(id: "ATL LAX", in: namespace)
                    
                //June 17th
                Text("June 18th")
                    .font(.body)
                    //.fontWeight(.)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                    .offset(y: -20)
                    .padding(.leading, 10)
                
                HStack(alignment: .firstTextBaseline) {
                    Text("2")
                        .font(.system(size: 64))
                        .offset(y: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                        //.padding(.leading, 10)
                    Text("hr")
                        .font(.system(size: 20))
                        .offset(y: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                    Text("15")
                        .font(.system(size: 64))
                        .offset(y: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                    Text("mins")
                        .font(.system(size: 20))
                        .offset(y: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.75)))
                }
               
            }

        } /*
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
           */
        
        /*
        Text("ATL -> LAX")
            .matchedGeometryEffect(id: "HomeView", in: namespace)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
         */
    }
}

struct FlightPlanItem2_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        //FlightPlanItem2(namespace: namespace, show: .constant(true))
        FlightPlanItem2()
    }
}
