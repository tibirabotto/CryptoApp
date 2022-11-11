//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Tibirica Neto on 2022-11-10.
//

import Foundation
import SwiftUI
 
class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
