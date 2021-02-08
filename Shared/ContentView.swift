//
//  ContentView.swift
//  Shared
//
//  Created by Pierre LAGARDE on 08/02/2021.
//  Copyright © 2021 Mark Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: xDripClientPluginDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(xDripClientPluginDocument()))
    }
}
