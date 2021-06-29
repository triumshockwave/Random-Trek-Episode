//
//  SettingsView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/28/21.
//

import SwiftUI

struct ResultView: View {
    @State private var series = "Star Trek"
    @State private var season = 1
    @State private var episodeNumber = 1
    @State private var title = "The Man Trap"
    
    var body: some View {
        VStack() {
            List() {
                Text(series)
                Text("Season " + String(season) + ", Episode " + String(episodeNumber))
                Text(title)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .preferredColorScheme(.dark)
        ResultView()
            .preferredColorScheme(.light)
    }
}
