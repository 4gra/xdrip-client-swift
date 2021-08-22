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
    public static var onboardingImage: UIImage? {
        UIImage(systemName: "drop.triangle")
    }
    
    public static func setupViewController(bluetoothProvider: BluetoothProvider, displayGlucoseUnitObservable: DisplayGlucoseUnitObservable, colorPalette: LoopUIColorPalette, allowDebugFeatures: Bool) -> SetupUIResult<CGMManagerViewController, CGMManagerUI> {
        return .createdAndOnboarded(xDripClientManager())
    }

    
//    public static func setupViewController(bluetoothProvider: BluetoothProvider, colorPalette: LoopUIColorPalette) -> SetupUIResult<UIViewController & CGMManagerCreateNotifying & CGMManagerOnboardNotifying & CompletionNotifying, CGMManagerUI> {
//        return .createdAndOnboarded(xDripClientManager())
//    }
    
    public func settingsViewController(bluetoothProvider: BluetoothProvider, displayGlucoseUnitObservable: DisplayGlucoseUnitObservable, colorPalette: LoopUIColorPalette, allowDebugFeatures: Bool) ->CGMManagerViewController {
        let settings = xDripClientSettingsViewController(cgmManager: self, displayGlucoseUnitObservable: displayGlucoseUnitObservable, allowsDeletion: true)
        let nav = CGMManagerSettingsNavigationViewController(rootViewController: settings)
        return nav
    }
    
//    public func settingsViewController(for displayGlucoseUnitObservable: DisplayGlucoseUnitObservable, bluetoothProvider: BluetoothProvider, colorPalette: LoopUIColorPalette) -> (UIViewController & CGMManagerOnboardNotifying & CompletionNotifying) {
//        let settings = xDripClientSettingsViewController(cgmManager: self, displayGlucoseUnitObservable: displayGlucoseUnitObservable, allowsDeletion: true)
//        let nav = CGMManagerSettingsNavigationViewController(rootViewController: settings)
//        return nav
//    }
    
    public var cgmStatusBadge: DeviceStatusBadge? {
        nil
    }
        
    public var smallImage: UIImage? {
        UIImage(systemName: "drop.triangle")
    }
    
    public var cgmStatusHighlight: DeviceStatusHighlight? {
        return nil
    }
    
    public var cgmLifecycleProgress: DeviceLifecycleProgress? {
        return nil
    }
    
}
