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
    
    func createSeries(for seriesName: String) -> Series {
        var episodeList: [Episode] = []
        
        if seriesName == "Star Trek" {
            episodeList.append(Episode(title: "The Man Trap", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Charlie X", series: seriesName, season: 1, number: 2))
        }
        
        if seriesName == "Star Trek: The Animated Series" {
            episodeList.append(Episode(title: "Beyond the Farthest Star", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Yesteryear", series: seriesName, season: 1, number: 2))
        }
        
        if seriesName == "Star Trek: The Next Generation" {
            episodeList.append(Episode(title: "Encounter At Farpoint", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "The Naked Now", series: seriesName, season: 1, number: 3))
        }
        
        if seriesName == "Star Trek: Deep Space Nine" {
            episodeList.append(Episode(title: "Emissary", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Past Prologue", series: seriesName, season: 1, number: 3))
        }
        
        if seriesName == "Star Trek: Voyager" {
            episodeList.append(Episode(title: "Caretaker", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Parallax", series: seriesName, season: 1, number: 3))
        }
        
        if seriesName == "Star Trek: Enterprise" {
            episodeList.append(Episode(title: "Broken Bow", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Fight or Flight", series: seriesName, season: 1, number: 3))
        }
        
        if seriesName == "Star Trek: Discovery" {
            episodeList.append(Episode(title: "The Vulcan Hello", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Battle at the Binary Stars", series: seriesName, season: 1, number: 2))
        }
        
        if seriesName == "Star Trek: Picard" {
            episodeList.append(Episode(title: "Remembrance", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Maps and Legends", series: seriesName, season: 1, number: 2))
        }
        
        if seriesName == "Star Trek: Lower Decks" {
            episodeList.append(Episode(title: "Second Contact", series: seriesName, season: 1, number: 1))
            episodeList.append(Episode(title: "Envoys", series: seriesName, season: 1, number: 2))
        }

        return Series(episodes: episodeList)
    }
    
    func createIncludedEpisodes(with options: Options) -> [Episode] {
        var episodeList: [Episode] = []
        
        if options.tosSelected {
            let series = createSeries(for: "Star Trek")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.tasSelected {
            let series = createSeries(for: "Star Trek: The Animated Series")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.tngSelected {
            let series = createSeries(for: "Star Trek: The Next Generation")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.ds9Selected {
            let series = createSeries(for: "Star Trek: Deep Space Nine")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.voySelected {
            let series = createSeries(for: "Star Trek: Voyager")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.entSelected {
            let series = createSeries(for: "Star Trek: Enterprise")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.dscSelected {
            let series = createSeries(for: "Star Trek: Discovery")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.picSelected {
            let series = createSeries(for: "Star Trek: Picard")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.ldSelected {
            let series = createSeries(for: "Star Trek: Lower Decks")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        return episodeList
    }
        
    func generateRandomEpisode() -> Episode {
        let episodeList = createIncludedEpisodes(with: applicationOptions)
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
