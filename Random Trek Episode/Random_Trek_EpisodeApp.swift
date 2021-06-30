//
//  Random_Trek_EpisodeApp.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import SwiftUI

@main
struct Random_Trek_EpisodeApp: App {
    @StateObject var applicationOptions = Options()
    
    var body: some Scene {
        WindowGroup {
            SettingsView()
        }
    }
}
