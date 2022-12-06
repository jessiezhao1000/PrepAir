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
    @Binding var userName: String
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
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
            RootMapView(userName: $userName)
        }//.overlay(RootMapView(userName: $userName))
        
//        if showHome{
//            HomeView()
//        }
    }
}

struct MapView_Previews: PreviewProvider {
    @State static var userName: String = ""
    static var previews: some View {
        MapView(userName: $userName)
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.640411, longitude: -84.419853), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
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
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
    }
    
func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
