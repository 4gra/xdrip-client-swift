//
//  xDripClientManager+UI.swift
//  Loop
//
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import SwiftUI
import LoopKit
import LoopKitUI
import HealthKit
import xDripClient


extension xDripClientManager: CGMManagerUI {
    
    public static func setupViewController(glucoseTintColor: Color, guidanceColors: GuidanceColors) -> (UIViewController & CGMManagerSetupViewController & CompletionNotifying)? {
        return nil  // We don't require configuration
    }
    
    public func settingsViewController(for glucoseUnit: HKUnit, glucoseTintColor: Color, guidanceColors: GuidanceColors) -> (UIViewController & CompletionNotifying) {
        let settings = xDripClientSettingsViewController(cgmManager: self, glucoseUnit: glucoseUnit, allowsDeletion: true)
        let nav = SettingsNavigationViewController(rootViewController: settings)
        return nav
    }
    
    public var smallImage: UIImage? {
            self.getSmallImage()
    }
    
    public var cgmStatusHighlight: DeviceStatusHighlight? {
        return nil
    }
    
    public var cgmLifecycleProgress: DeviceLifecycleProgress? {
        return nil
    }
    
}
