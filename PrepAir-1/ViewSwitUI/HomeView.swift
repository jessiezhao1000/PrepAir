//
//  HomeView.swift
//  PrepAir
//
//  Created by Yiwen Zhao on 7/29/22.
//

import SwiftUI
import CodeScanner

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    
    @State private var contentOffset = CGFloat(0)
    @State var focusModeShow = false
    
    @State var text = ""
    @State var isBegin = false
    @State private var calander = Date()
    @State var showDatePicker = false
    
    @Binding var userName: String
    
    @State var isPresentingScanner = false
    @State var scannedCode: String  = "Scan your QR code"
    @State private var scrollViewContentOffset = CGFloat(0)

    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: {
                result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    
    var body: some View {
        //let UNCHANGENAME = userName
        ZStack {
            Color.white.ignoresSafeArea(.all)
            TrackableScrollView(offsetChanged: { offsetHome in
                contentOffset = offsetHome.y
                print("contentOffset", contentOffset)
                if (contentOffset > 100) {
                    withAnimation {
                        focusModeShow = true
                        //homeViewShow = false
                    }
                }

            })
            //TrackableScrollView1(.vertical, contentOffset: $scrollViewContentOffset)
            {
                VStack(spacing: 0) {
                    //Image("Head")
                    //FocusModeView()
                    
                    //header
                    ZStack {
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.3137255012989044, green: 0.3921568691730499, blue: 0.6980392336845398, alpha: 1)))
                        //.frame(width: 400, height: 260)
                            .frame(width: 400, height: 450)
                            .onTapGesture {
                                if showDatePicker == true {
                                    showDatePicker.toggle()
                                }
                            }
                        VStack {
                            Text("Enter Focus Mode").offset(y:120)
                                .foregroundColor(.white)
                            //Welcome, Yiqian
                            Text("Welcome, ")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                                .padding(.top, 225)
                            
                            
                            Text(self.userName)
                                .font(.system(size: 40))
                                .fontWeight(.regular)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.leading])
                            
                            //Rectangle 4
                            HStack {
                                /*
                                 RoundedRectangle(cornerRadius: 25)
                                 .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                 .frame(width: 247, height: 40)
                                 .padding([.leading])
                                 */
                                
                                TextField("Select your flight", text: $text, onEditingChanged: { (editting) in
                                    self.showDatePicker = editting
                                }, onCommit: {showDatePicker.toggle()})
                                .textFieldStyle(OvalTextFieldStyle1())
                                .disableAutocorrection(true)
                                .foregroundColor(Color.black)
                                .padding(.leading)
                                
                                
                                Spacer()
                                // Rectangle 4
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .frame(width: 79, height: 40)
                                        .padding(.trailing)
                                        .sheet(isPresented: $isPresentingScanner){
                                            self.scannerSheet}
                                    Text("Scan")
                                        .offset(x:-9)
                                        .font(.system(size: 16))
                                    //                                    Button("Scan"){
                                    ////                                        self.isPresentingScanner = true
                                    //
                                    //
                                    //                                    }.sheet(isPresented: $isPresentingScanner){
                                    //                                        self.scannerSheet}
                                }.onTapGesture{
                                    self.isPresentingScanner = true
                                }
                                
                                //                                label: do {
                                //                                    Image(systemName: "camera.fill")
                                //                                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                //                                        .font(.title)
                                //                                        .frame(width: 79, height: 40)
                                //                                        .padding(.trailing)
                                //                                    }
                                
                            }
                        }
                        
                    }.offset(y:-75).frame(height:260)
                    
                    if self.showDatePicker {
                        ContendCalanderView()
                            .padding(.top)
                        /*
                         HeaderView(userName: $userName)
                         .offset(y:-75)
                         .frame(height:260)
                         */
                        
                    }
                    Text("Your Plans")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading])
                        .padding(.top, 30)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            if !show {
                                FlightPlanItem(namespace: namespace, show: $show)
                                    .padding()
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                            show.toggle()
                                        }
                                    }
                            }
                            //Image("LAX to ATL")
                            FlightPlanItem2()
                                .padding()
                            FlightPlanItem3()
                                .padding()
                        }
                    }
                    
                    Text("Predicted Time")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top])
                    
                    
                    Image("Predicted Time")
                        .padding(.bottom, 100)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea(.all)
            //.overlay(RootHomeView(userName: $userName))
            RootHomeView(userName: $userName)
            if show {
                //withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    //PlanEditView(namespace: namespace, show: $show)
                    PlanView(userName: $userName)
                        //.ignoresSafeArea(.all)
                //}
                
            }
            if focusModeShow {
                FocusModeView(userName: $userName)
               
            }
            
        }
        .frame(width: 400, height: 800)
        
      
    }
  
}

struct OvalTextFieldStyle1: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(.white)
            .cornerRadius(20)
            .frame(width: 247, height: 40)
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var userName: String = ""
    static var previews: some View {
        HomeView(userName: $userName)
    }
}
