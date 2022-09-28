//
//  ContentView.swift
//  WidgetDemo
//
//  Created by JOYNAL ABEDIN on 28/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hailActive: Bool = false
    @State private var thunderActive: Bool = false
    @State private var tropicalActive: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: WeatherDetailView(name: "Hail Storms", icon: "cloud.hail"), isActive: $hailActive) {
                    Label("Hail Storms", systemImage: "cloud.hail")
                }
                NavigationLink(destination: WeatherDetailView(name: "Thunder Storms", icon: "cloud.bolt.rain"), isActive: $thunderActive) {
                    Label("Thunder Storms", systemImage: "cloud.bolt.rain")
                }
                NavigationLink(destination: WeatherDetailView(name: "Tropical Storms", icon: "tropicalstorm"), isActive: $tropicalActive) {
                    Label("Tropical Storms", systemImage: "tropicalstorm")
                }
            }
        }
        .navigationTitle("Severe Weather")
        .onOpenURL { url in
            self.hailActive = url == hairlUrl
            self.thunderActive = url == thunderUrl
            self.tropicalActive = url == tropicalUrl
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
