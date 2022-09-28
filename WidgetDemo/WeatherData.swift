//
//  WeatherData.swift
//  WidgetDemo
//
//  Created by JOYNAL ABEDIN on 28/9/22.
//

import SwiftUI
import WidgetKit

struct WeatherEntry: TimelineEntry {
    var date: Date
    let city: String
    let temperature: Int
    let description: String
    let icon: String
    let image: String
    let url: URL?
}

let hairlUrl = URL(string: "weatherwidget://hail")
let thunderUrl = URL(string: "weatherwidget://thunder")
let tropicalUrl = URL(string: "weatherwidget://tropical")

let londonTimeline = [WeatherEntry(date: Date(), city: "London", temperature: 87, description: "Hail Storm", icon: "cloud.hail", image: "hail", url: hairlUrl),
                      WeatherEntry(date: Date(), city: "London", temperature: 92, description: "Thunder Storm", icon: "cloud.bolt.rain", image: "thunder", url: thunderUrl),
                      WeatherEntry(date: Date(), city: "London", temperature: 95, description: "Hail Storm", icon: "cloud.hail", image: "hail", url: hairlUrl)]

let miamiTimeline = [WeatherEntry(date: Date(), city: "Miami", temperature: 87, description: "Thunder Storm", icon: "cloud.bolt.rain", image: "thunder", url: thunderUrl),
                     WeatherEntry(date: Date(), city: "Miami", temperature: 92, description: "Tropical Storm", icon: "cloud.bolt.rain", image: "thunder", url: tropicalUrl),
                     WeatherEntry(date: Date(), city: "Miami", temperature: 95, description: "Thunder Storm", icon: "cloud.bolt.rain", image: "thunder", url: thunderUrl)]
