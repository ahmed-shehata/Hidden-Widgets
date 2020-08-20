//
//  AppIconService.swift
//  HomeScreenSpaces
//
//  Created by Aryan Chaubal on 8/8/20.
//

import UIKit

class AppIconService {
    
    let application = UIApplication.shared
    
    enum AppIcon: String {
        
        case primary = "Blue"
        case orange = "Orange"
        case black = "Dark"
        case amoled = "AMOLED"
        case bluegreen = "Blue Green"
    }
    func changeAppIcon(to appIcon: AppIcon) {
        let iconString: String? = appIcon == .primary ? nil : appIcon.rawValue
        application.setAlternateIconName(iconString)
    }
}
