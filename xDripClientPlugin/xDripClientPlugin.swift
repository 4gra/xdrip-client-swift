//
//  CGMBLEKitG6Plugin.swift
//  CGMBLEKitG6Plugin
//
//  Created by Nathaniel Hamming on 2019-12-13.
//  Copyright © 2019 LoopKit Authors. All rights reserved.
//

import LoopKitUI
import xDripClient
import xDripClientUI
import os.log

class xDripClientPlugin: NSObject, CGMManagerUIPlugin {
    //private let log = OSLog(category: "xDripClientPlugin")
    
    public var cgmManagerType: CGMManagerUI.Type? {
        return xDripClientManager.self
    }
    
    override init() {
       super.init()
       // log.default("xDripClientPlugin Instantiated")
    }
}
