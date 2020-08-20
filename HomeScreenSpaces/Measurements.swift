//
//  Measurements.swift
//  HomeScreenSpaces
//
//  Created by Aryan Chaubal on 8/4/20.
//

import Foundation

class Measurements {
    
//    fileprivate static let SIZE_PLACEHOLDER = 200
    
    //// Width and height of the widget
    static let WIDGET_SIZE: [String: Int] = [
        // Standard Dispay Mode
        "828x1792": 338, // iPhone XR, iPhone 11
        "1242x2688": 507, // iPhone XS Max, iPhone 11 Pro Max
        "1125x2436": 465, // iPhone X, iPhone XS, iPhone 11 Pro
        "1242x2208": 477, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
        "750x1334": 296, // iPhone 6, iPhone 6S, iPhone 7, iPhone 8, iPhone SE 2
        "640x1136": 282, // iPhone 5, iPhone 5S, iPhone 5C, iPhone SE, iPod Touch 7
        
        // Zoomed Display Mode
        "750x1624": 310, // iPhone XR, iPhone 11
        "1125x2001": 444, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
    ]
    
    //// Vertical spacing between top edges of two widgets
    static let VERTICAL_SPACING: [String: Int] = [
        // Standard Dispay Mode
        "828x1792": 420, // iPhone XR, iPhone 11
        "1242x2688": 630, // iPhone XS Max, iPhone 11 Pro Max
        "1125x2436": 570, // iPhone X, iPhone XS, iPhone 11 Pro
        "1242x2208": 594, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
        "750x1334": 352, // iPhone 6, iPhone 6S, iPhone 7, iPhone 8, iPhone SE 2
        "640x1136": 340, // iPhone 5, iPhone 5S, iPhone 5C, iPhone SE, iPod Touch 7
        
        // Zoomed Display Mode
        "750x1624": 380, // iPhone XR, iPhone 11
        "1125x2001": 528, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
    ]
    
    //// Vertical spacing between right edges of two widgets
    static let HORIZONTAL_SPACING: [String: Int] = [
        // Standard Dispay Mode
        "828x1792": 382, // iPhone XR, iPhone 11
        "1242x2688": 573, // iPhone XS Max, iPhone 11 Pro Max
        "1125x2436": 522, // iPhone X, iPhone XS, iPhone 11 Pro
        "1242x2208": 567, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
        "750x1334": 346, // iPhone 6, iPhone 6S, iPhone 7, iPhone 8, iPhone SE 2
        "640x1136": 302, // iPhone 5, iPhone 5S, iPhone 5C, iPhone SE, iPod Touch 7
        
        // Zoomed Display Mode
        "750x1624": 348, // iPhone XR, iPhone 11
        "1125x2001": 519, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
    ]
    
    //// Space between top edge of widget and image (screenshot)
    static let TOP_SPACING: [String: Int] = [
        // Standard Dispay Mode
        "828x1792": 160, // iPhone XR, iPhone 11
        "1242x2688": 228, // iPhone XS Max, iPhone 11 Pro Max
        "1125x2436": 213, // iPhone X, iPhone XS, iPhone 11 Pro
        "1242x2208": 114, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
        "750x1334": 60, // iPhone 6, iPhone 6S, iPhone 7, iPhone 8, iPhone SE 2
        "640x1136": 60, // iPhone 5, iPhone 5S, iPhone 5C, iPhone SE, iPod Touch 7
        
        // Zoomed Display Mode
        "750x1624": 142, // iPhone XR, iPhone 11
        "1125x2001": 90, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
    ]
    
    //// Space between left edge of widget and image (screenshot)
    static let LEFT_SPACING: [String: Int] = [
        // Standard Dispay Mode
        "828x1792": 54, // iPhone XR, iPhone 11
        "1242x2688": 81, // iPhone XS Max, iPhone 11 Pro Max
        "1125x2436": 69, // iPhone X, iPhone XS, iPhone 11 Pro
        "1242x2208": 99, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
        "750x1334": 54, // iPhone 6, iPhone 6S, iPhone 7, iPhone 8, iPhone SE 2
        "640x1136": 28, // iPhone 5, iPhone 5S, iPhone 5C, iPhone SE, iPod Touch 7
        
        // Zoomed Display Mode
        "750x1624": 46, // iPhone XR, iPhone 11
        "1125x2001": 81, // iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
    ]
    
}
