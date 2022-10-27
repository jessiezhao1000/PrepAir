//
//  MapView.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 10/26/22.
//
import MapKit
import SwiftUI

struct MapView: View {
    @State var showHome = false
    @StateObject private var viewModel = MapViewModel()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.748997, longitude: -84.387985), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    var body: some View {
        ZStack {
            
               
                
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .ignoresSafeArea()
                    .accentColor(Color(.systemPink))
                    .onAppear{
                        viewModel.checkLocationAuthorization()
                }
//            VStack {
//                Image("Back")
//                    .padding([.leading, .top])
//                    .frame(maxWidth: .infinity,alignment: .leading)
//                    .onTapGesture{
//                        showHome.toggle()
//                }
//                Spacer()
//            }
                
        }.overlay(RootView())
//        if showHome{
//            HomeView()
//        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
   private func checkLocationServiceEnable() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
            
            
        }else{
            print("Your location service is off")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location is restricted")
        case .denied:
            print("You have denied location permission, go to settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
