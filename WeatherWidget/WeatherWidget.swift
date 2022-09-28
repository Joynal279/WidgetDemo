//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by JOYNAL ABEDIN on 28/9/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(date: Date(), city: "London", temperature: 89, description: "Thunder Storm", icon: "cloud.bolt.rain", image: "thunder")
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        let entry =  WeatherEntry(date: Date(), city: "London", temperature: 89, description: "Thunder Storm", icon: "cloud.bolt.rain", image: "thunder")
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [WeatherEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        var eventDate = Date()
        let halfMinute: TimeInterval = 30
        
        for var entry in londonTimeline {
            entry.date = eventDate
            eventDate += halfMinute
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let configuration: ConfigurationIntent
//}
//


struct WeatherWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        ZStack {
            Color("weatherBackgroundColor")
            HStack {
                WeatherSubView(entry: entry)
                if widgetFamily == .systemMedium {
                    Image(entry.image)
                        .resizable()
                }
            }
            
        }
    }
}

@main
struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WeatherWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherWidgetEntryView(entry: WeatherEntry(date: Date(), city: "London", temperature: 89, description: "Thunder Storm", icon: "cloud.bolt.rain", image: "thunder"))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            WeatherWidgetEntryView(entry: WeatherEntry(date: Date(), city: "London", temperature: 89, description: "Thunder Storm", icon: "cloud.bolt.rain", image: "thunder"))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}


struct WeatherSubView: View {
    
    var entry: WeatherEntry
    
    var body: some View {
        VStack {
            VStack {
                Text("\(entry.city)")
                    .font(.title)
                Image(systemName: entry.icon)
                    .font(.largeTitle)
                Text("\(entry.description)")
                    .frame(minWidth: 125, minHeight: nil)
            }
            .padding(.bottom, 2)
            .background(ContainerRelativeShape()
                        .fill(Color("weatherInsetColor")))
            Label("\(entry.temperature)", systemImage: "thermometer")
        }
        .foregroundColor(.white)
        .padding()
    }
}
