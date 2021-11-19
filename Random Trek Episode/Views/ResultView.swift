//
//  SettingsView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/28/21.
//

import SwiftUI

struct ResultView: View {
    //MARK: - Properties
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var applicationOptions: Options
    
    @State private var chosenEpisode = Episode(title: "Episode Name", series: "Series Name", season: 0, number: 0)
    
    //MARK: - App logic methods
    
    func createIncludedEpisodes(with options: Options) -> [Episode] {
        var episodeList: [Episode] = []
        
        for (series) in options.seriesList {
            if series.isSelected {
                for episode in series.episodes {
                    episodeList.append(episode)
                }
            }
        }
        
        return episodeList
    }
        
    func generateRandomEpisode() -> Episode {
        let episodeList = createIncludedEpisodes(with: applicationOptions)
        if episodeList.isEmpty {
            return Episode(title: "", series: "No Series Selected", season: 0, number: 0)
        }
        let number = Int.random(in: 0..<episodeList.count)
        
        return episodeList[number]
    }
    
    //MARK: - View hierarchy
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(chosenEpisode.series)
                        .font(.title)
                        .fontWeight(.black)
                    Text("Season \(String(chosenEpisode.season))")
                    Text("Episode \(String(chosenEpisode.number))")
                    Text(chosenEpisode.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 10.0)
                }
                .onAppear() {
                    chosenEpisode = generateRandomEpisode()
                }
                Spacer()
            }
            Spacer()
            ZStack() {
                Button(action: { chosenEpisode = generateRandomEpisode() }) {
                    Text("Engage")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
        }
        .padding()
        .navigationTitle(Text("Your Mission:"))
    }
}

//MARK: - Previews

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            ResultView().navigationBarHidden(true)
                .environmentObject(Options())
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.dark)

        NavigationView() {
            ResultView().navigationBarHidden(true)
                .environmentObject(Options())
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.light)
    }
}
