//
//  GifterApp.swift
//  Gifter
//
//  Created by Дарья Сербер on 22.01.2022.
//

import SwiftUI

@main
struct GifterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router())
                .onAppear {
                    Configurator.shared.setup()
                }
        }
    }
}
