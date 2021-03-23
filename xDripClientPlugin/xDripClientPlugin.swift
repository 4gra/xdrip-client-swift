//
//  CGMBLEKitG6Plugin.swift
//  CGMBLEKitG6Plugin
//
//  Created by Nathaniel Hamming on 2019-12-13.
//  Copyright © 2019 LoopKit Authors. All rights reserved.
//

import Foundation
import LoopKitUI
import xDripClient
import xDripClientUI
import os.log

class xDripClientPlugin: NSObject, LoopUIPlugin {
    
    //private let log = OSLog(category: "xDripClientPlugin")
    
    public var pumpManagerType: PumpManagerUI.Type? {
        return nil
    }
    
    public var cgmManagerType: CGMManagerUI.Type? {
        return xDripClientManager.self
    }
    
    override init() {
        super.init()
       // log.default("xDripClientPlugin Instantiated")
    }
}
