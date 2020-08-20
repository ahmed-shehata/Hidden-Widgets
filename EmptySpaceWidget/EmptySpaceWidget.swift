//
//  EmptySpaceWidget.swift
//  EmptySpaceWidget
//
//  Created by Aryan Chaubal on 8/3/20.
//

import WidgetKit
import SwiftUI

// MARK: - Small Widget Timeline provider
struct ProviderSmall: IntentTimelineProvider {
    
    typealias Entry = EmptySpaceEntry
    typealias Intent = PositionSmallIntent
    
    func snapshot(for configuration: PositionSmallIntent, with context: Context, completion: @escaping (EmptySpaceEntry) -> ()) {
        let entry = EmptySpaceEntry(date: Date(), position: "topLeftSmall")
        completion(entry)
    }
    
    func placeholder(in context: Context) -> EmptySpaceEntry {
        let entry = EmptySpaceEntry(date: Date(), position: "topLeftSmall")
        return entry
    }
    
    func timeline(for configuration: PositionSmallIntent, with context: Context, completion: @escaping (Timeline<EmptySpaceEntry>) -> ()) {
        let positions = ["topLeftSmall", "topRightSmall", "midLeftSmall", "midRightSmall", "bottomLeftSmall", "bottomRightSmall"]
        var index = configuration.position.rawValue
        if index == 0 {
            index = 1
        }
        let timeline = Timeline(entries: [EmptySpaceEntry(position: positions[index - 1])], policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - Medium Widget Timeline provider
struct ProviderMedium: IntentTimelineProvider {
    
    typealias Entry = EmptySpaceEntry
    typealias Intent = PositionMediumIntent
    
    func snapshot(for configuration: PositionMediumIntent, with context: Context, completion: @escaping (EmptySpaceEntry) -> ()) {
        let entry = EmptySpaceEntry(date: Date(), position: "topMedium")
        completion(entry)
    }
    
    func placeholder(in context: Context) -> EmptySpaceEntry {
        let entry = EmptySpaceEntry(date: Date(), position: "topMedium")
        return entry
    }
    
    func timeline(for configuration: PositionMediumIntent, with context: Context, completion: @escaping (Timeline<EmptySpaceEntry>) -> ()) {
        let positions = ["topMedium", "midMedium", "bottomMedium"]
        var index = configuration.position.rawValue
        if index == 0 {
            index = 1
        }
        let timeline = Timeline(entries: [EmptySpaceEntry(position: positions[index - 1])], policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - Medium Large Timeline provider
struct ProviderLarge: IntentTimelineProvider {
    
    typealias Entry = EmptySpaceEntry
    typealias Intent = PositionLargeIntent
    
    func snapshot(for configuration: PositionLargeIntent, with context: Context, completion: @escaping (EmptySpaceEntry) -> ()) {
        let entry = EmptySpaceEntry(date: Date(), position: "topLarge")
        completion(entry)
    }
    
    func placeholder(in context: Context) -> EmptySpaceEntry {
        let entry = EmptySpaceEntry(date: Date(), position: "topLarge")
        return entry
    }
    
    func timeline(for configuration: PositionLargeIntent, with context: Context, completion: @escaping (Timeline<EmptySpaceEntry>) -> ()) {
        let positions = ["topLarge", "bottomLarge"]
        var index = configuration.position.rawValue
        if index == 0 {
            index = 1
        }
        let timeline = Timeline(entries: [EmptySpaceEntry(position: positions[index - 1])], policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - Timeline entry
struct EmptySpaceEntry: TimelineEntry {
    public var date: Date = Date()
    public var position: String
}

// Small widget configuration
struct EmptySpaceWidgetSmall: Widget {
    private let kind: String = "EmptySpaceWidgetSmall"

    public var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: PositionSmallIntent.self, provider: ProviderSmall()) { entry in
            EmptySpaceWidgetView(entry: entry)
        }
        .configurationDisplayName("Small Hidden Widget")
        .description("A 2x2 widget that blends into your wallpaper to create the illusion of empty space.")
        .supportedFamilies([.systemSmall])
    }
}

// MARK: - Medium widget configuration
struct EmptySpaceWidgetMedium: Widget {
    private let kind: String = "EmptySpaceWidgetMedium"

    public var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: PositionMediumIntent.self, provider: ProviderMedium()) { entry in
            EmptySpaceWidgetView(entry: entry)
        }
        .configurationDisplayName("Medium Hidden Widget")
        .description("A 2x4 widget that blends into your wallpaper to create the illusion of empty space.")
        .supportedFamilies([.systemMedium])
    }
}

// MARK: - Large widget configuration
struct EmptySpaceWidgetLarge: Widget {
    private let kind: String = "EmptySpaceWidgetLarge"

    public var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: PositionLargeIntent.self, provider: ProviderLarge()) { entry in
            EmptySpaceWidgetView(entry: entry)
        }
        .configurationDisplayName("Large Hidden Widget")
        .description("A 4x4 widget that blends into your wallpaper to create the illusion of empty space.")
        .supportedFamilies([.systemLarge])
    }
}

//MARK: - Main widget bundle configuration
@main
struct EmptySpaceWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        EmptySpaceWidgetSmall()
        EmptySpaceWidgetMedium()
        EmptySpaceWidgetLarge()
    }
}
