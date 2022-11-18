//
//  ParkingMainView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 11/17/22.
//

import SwiftUI

@available(iOS 16.0, *)
struct ParkingMainView: View {
    //show image picker
    @State var showImagePicker: Bool = false
    //show selected image
    @State var selectedImage: Image? = Image("")
    @available(iOS 16.0, *)
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 0){
            
                ParkingHeader()
                
                Text("Available Parking Spot: 30/100 ")
                    .font(.body)
                    .fontWeight(.regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top])
                
                HStack{
                    Rectangle()
                        .fill(Color(red: 90, green: 90, blue: 90))
                        .frame(width: 390, height: 100)
                        .cornerRadius(45)
                        .shadow(radius: 10)
                        .padding(10)
                        .overlay(Group{
                            Text("2nd Floor 3 Area 305 Number")
                        })
                }
                    
                //create button for upload image
                Button(action: {
                    self.showImagePicker.toggle()
                },label: {
                    Text("Upload Picture")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                })
                  
            Spacer()
                //show image
                self.selectedImage?.resizable().scaledToFit()
                
            }
            .sheet(isPresented: $showImagePicker, content: {ImagePicker(image: self.$selectedImage)  })
           
        }.ignoresSafeArea(.all)
    }
}


struct ParkingMainView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            ParkingMainView()
        } else {
            // Fallback on earlier versions
        }
    }
}
