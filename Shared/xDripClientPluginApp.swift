//
//  xDripClientPluginApp.swift
//  Shared
//
//  Created by Pierre LAGARDE on 08/02/2021.
//  Copyright © 2021 Mark Wilson. All rights reserved.
//

import SwiftUI

@main
struct xDripClientPluginApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: xDripClientPluginDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
