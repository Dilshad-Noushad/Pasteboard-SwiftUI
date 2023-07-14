//
//  PasteBoardApp.swift
//  PasteBoard
//
//  Created by Dilshad N on 27/11/22.
//

import SwiftUI

@main
struct PasteBoardApp: App {
    @StateObject var vm = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
