//
//  SettingsView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/28/21.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var applicationOptions: Options
    
    @State private var chosenEpisode = Episode(title: "Episode Name", series: "Series Name", season: 0, number: 0)
    @State private var episodeList: [Episode] = []
    
    func createIncludedEpisodes(with options: Options) {
        episodeList = []
        
        if options.tosSelected {
            let tosSeries = createSeries(for: "Star Trek")
            for episode in tosSeries.episodes {
                episodeList.append(episode)
            }
        }
        if options.tngSelected {
            let tngSeries = createSeries(for: "Star Trek: The Next Generation")
            for episode in tngSeries.episodes {
                episodeList.append(episode)
            }
        }
    }
    
    func createSeries(for seriesName: String) -> Series {
        var episodeList: [Episode] = []
        
        if seriesName == "Star Trek" {
            episodeList.append(Episode(title: "The Man Trap", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Charlie X", series: seriesName, season: 1, number: 2))
        }
        
        if seriesName == "Star Trek: The Next Generation" {
            episodeList.append(Episode(title: "Encounter At Farpoint", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "The Naked Now", series: seriesName, season: 1, number: 3))
        }

        return Series(episodes: episodeList)
    }
    
//    @State private var series = "Star Trek"
//    @State private var season = 1
//    @State private var episodeNumber = 1
//    @State private var title = "The Man Trap"
        
    func generateRandomEpisode() -> Episode {
        createIncludedEpisodes(with: applicationOptions)
        let number = Int.random(in: 0..<episodeList.count)
        
        #if DEBUG
        var enabledSeriesString = ""
        
        print("Random Number: \(number)")
        
        var enabledSeriesList: [String] = []
        
        if applicationOptions.tosSelected {
            enabledSeriesList.append("TOS")
        }
        if applicationOptions.tasSelected {
            enabledSeriesList.append("TAS")
        }
        if applicationOptions.tngSelected {
            enabledSeriesList.append("TNG")
        }
        if applicationOptions.ds9Selected {
            enabledSeriesList.append("DS9")
        }
        if applicationOptions.voySelected {
            enabledSeriesList.append("VOY")
        }
        if applicationOptions.entSelected {
            enabledSeriesList.append("ENT")
        }
        if applicationOptions.dscSelected {
            enabledSeriesList.append("DSC")
        }
        if applicationOptions.picSelected {
            enabledSeriesList.append("PIC")
        }
        if applicationOptions.ldSelected {
            enabledSeriesList.append("LD")
        }
        
        for i in 0..<enabledSeriesList.count {
            enabledSeriesString.append("\(enabledSeriesList[i]) ")
        }
        
        print("Enabled series: \(enabledSeriesList)")
        #endif
        
        return episodeList[number]
    }
    
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

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            ResultView().navigationBarHidden(true)
                .environmentObject(Episode(title: "The Man Trap", series: "Star Trek", season: 1, number: 1))
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.dark)

        NavigationView() {
            ResultView().navigationBarHidden(true)
                .environmentObject(Episode(title: "The Man Trap", series: "Star Trek", season: 1, number: 1))
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.light)
    }
}
