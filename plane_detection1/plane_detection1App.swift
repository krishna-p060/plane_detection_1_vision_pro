//
//  plane_detection1App.swift
//  plane_detection1
//
//  Created by Apple on 11/04/24.
//

import SwiftUI
import ARKit


@main
struct plane_detection1App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//
//        ImmersiveSpace(id: "ImmersiveSpace") {
//            ImmersiveView()
//        }.immersionStyle(selection: .constant(.full), in: .full)
//    }
    @State var session = ARKitSession()
        @State var immersionState: ImmersionStyle = .mixed
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
            ImmersiveSpace(id: "appSpace") {
                //MixedImmersionView()
                Text("Hello, Mixed Reality!")
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.5))
                                .frame(width: 200, height: 100)
                .task {
                    let planeData = PlaneDetectionProvider(alignments: [.horizontal, .vertical])
                    
                    if PlaneDetectionProvider.isSupported {
                        print("success")
                        do {
                            try await session.run([planeData])
                            for await _ in planeData.anchorUpdates {
                                // Update app state.
                                print("plane--")
                            }
                        } catch {
                            print("ARKit session error \(error)")
                        }
                    }
                }
            }
            .immersionStyle(selection: $immersionState, in: .mixed)
        }
}







