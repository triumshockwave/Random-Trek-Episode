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
    
    let seriesMapping: [String:String] = [
        "tos":"Star Trek",
        "tas":"Star Trek: The Animated Series",
        "tng":"Star Trek: The Next Generation",
        "ds9":"Star Trek: Deep Space Nine",
        "voy":"Star Trek: Voyager",
        "ent":"Star Trek: Enterprise",
        "dsc":"Star Trek: Discovery",
        "pic":"Star Trek: Picard",
        "ld" :"Star Trek: Lower Decks"]
    
    //MARK: - App logic methods
    
    func createSeries(for seriesName: String) -> Series {
        var episodeList: [Episode] = []
        
        for episode in parseEpisodes(for: seriesName) {
            episodeList.append(episode)
        }

        return Series(episodes: episodeList)
    }
    
    func parseEpisodes(for series: String) -> [Episode] {
        var episodes: [Episode] = []
        let resourcePath = Bundle.main.resourcePath ?? ""
        let filePath = "\(resourcePath)/\(series).txt"
        var fileContent = ""
        #if DEBUG
        print("Path string: \(filePath)")
        #endif
        
//        MAKE SURE files do not have an extra space before the tabs as this will mess up the episode number retrieval
        do {
                try fileContent = String(contentsOfFile: filePath, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        } catch {
            print("Error reading file content: \(error)")
            return []
        }
        
        let lines = fileContent.components(separatedBy: "\n")
        for line in lines {
            let fields = line.components(separatedBy: "\t")
            let title = fields[0]
            let season = Int(fields[1].prefix(1)) ?? 0
            let number = Int(fields[1].suffix(2)) ?? 0
            
            #if DEBUG
            print("Episode Title: \(title), Season: \(season), Number: \(number)")
            #endif
            
            let episode = Episode(title: title, series: seriesMapping[series] ?? "", season: season, number: number)
            episodes.append(episode)
        }
        
        return episodes
    }
    
    func createIncludedEpisodes(with options: Options) -> [Episode] {
        var episodeList: [Episode] = []
        
        if options.tosSelected {
            let series = createSeries(for: "tos")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.tasSelected {
            let series = createSeries(for: "tas")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.tngSelected {
            let series = createSeries(for: "tng")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.ds9Selected {
            let series = createSeries(for: "ds9")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.voySelected {
            let series = createSeries(for: "voy")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.entSelected {
            let series = createSeries(for: "ent")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.dscSelected {
            let series = createSeries(for: "dsc")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.picSelected {
            let series = createSeries(for: "pic")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        if options.ldSelected {
            let series = createSeries(for: "ld")
            for episode in series.episodes {
                episodeList.append(episode)
            }
        }
        
        return episodeList
    }
        
    func generateRandomEpisode() -> Episode {
        let episodeList = createIncludedEpisodes(with: applicationOptions)
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
