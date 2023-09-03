//
//  CunhaApp.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import SwiftUI

@main
struct CunhaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: TickersViewModel())
        }
    }
}
