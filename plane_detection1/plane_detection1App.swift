//
//  plane_detection1App.swift
//  plane_detection1
//
//  Created by Apple on 11/04/24.
//

import SwiftUI

@main
struct plane_detection1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
