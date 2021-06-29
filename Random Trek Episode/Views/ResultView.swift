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
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(series)
                        .font(.title)
                        .fontWeight(.black)
                    Text("Season \(String(season))")
                    Text("Episode \(String(episodeNumber))")
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 10.0)
                }
                Spacer()
            }
            Spacer()
            ZStack() {
                Button(action: { generateRandomEpisode() }) {
                    Text("Engage")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                if UIDevice.current.userInterfaceIdiom == .phone {
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: { self.presentation.wrappedValue.dismiss() }) {
                            Image(systemName: "gear")
                                .resizable()
                                .foregroundColor(Color.primary)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
            }

            Divider()
            Text("Random Number: \(String(number))")
        }
        .padding()
        .navigationTitle(Text("Result"))
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            ResultView().navigationBarHidden(true)
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.dark)

        NavigationView() {
            ResultView().navigationBarHidden(true)
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.light)
    }
}
