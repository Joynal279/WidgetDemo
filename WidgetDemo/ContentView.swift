//
//  ContentView.swift
//  WidgetDemo
//
//  Created by JOYNAL ABEDIN on 28/9/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: WeatherDetailView(name: "Hail Storms", icon: "cloud.hail")) {
                    Label("Hail Storms", systemImage: "cloud.hail")
                }
                NavigationLink(destination: WeatherDetailView(name: "Thunder Storms", icon: "cloud.bolt.rain")) {
                    Label("Thunder Storms", systemImage: "cloud.bolt.rain")
                }
                NavigationLink(destination: WeatherDetailView(name: "Tropical Storms", icon: "tropicalstorm")) {
                    Label("Tropical Storms", systemImage: "tropicalstorm")
                }
            }
        }
        .navigationTitle("Severe Weather")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
