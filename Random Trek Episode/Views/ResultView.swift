//
//  SettingsView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/28/21.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var series = "Star Trek"
    @State private var season = 1
    @State private var episodeNumber = 1
    @State private var title = "The Man Trap"
    
    @State private var number = Int.random(in: 0...9999)
    
    func generateRandomEpisode() {
        number = Int.random(in: 0...9999)
    }
    
    var body: some View {
        VStack() {
            List() {
                Text(series)
                Text("Season " + String(season) + ", Episode " + String(episodeNumber))
                Text(title)
            }
            Button(action: { generateRandomEpisode() }) {
                Text("Engage")
                    .padding()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .clipShape(Capsule())
            }
            Divider()
            Text("Random Number: \(String(number))")
        }
        .navigationTitle(Text("Result"))
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            ResultView()
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.dark)

        NavigationView() {
            ResultView()
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.light)
    }
}
