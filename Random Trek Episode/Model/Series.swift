//
//  Series.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/30/21.
//

import Foundation

class Series: Identifiable{
    var seriesTitle: String
    var abbreviation: String
    var isSelected: Bool
    var episodes: [Episode]
    let id: UUID
    
    init(seriesTitle: String, abbreviation: String, isSelected: Bool, episodes: [Episode]) {
        self.seriesTitle = seriesTitle
        self.abbreviation = abbreviation
        self.isSelected = isSelected
        self.episodes = episodes
        self.id = UUID()
        
        self.parseEpisodes()        
    }
    
    func parseEpisodes() {
        let resourcePath = Bundle.main.resourcePath ?? ""
        let filePath = "\(resourcePath)/\(abbreviation.lowercased()).txt"
        var fileContent = ""
        #if DEBUG
        print("Path string: \(filePath)")
        #endif
        
//        MAKE SURE files do not have an extra space before the tabs as this will mess up the episode number retrieval
        do {
                try fileContent = String(contentsOfFile: filePath, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        } catch {
            print("Error reading file content: \(error)")
        }
        
        let lines = fileContent.components(separatedBy: "\n")
        for line in lines {
            let fields = line.components(separatedBy: "\t")
            let episodeTitle = fields[0]
            let season = Int(fields[1].prefix(1)) ?? 0
            let number = Int(fields[1].suffix(2)) ?? 0
            
            #if DEBUG
            print("Episode Title: \(seriesTitle), Season: \(season), Number: \(number)")
            #endif
            
            let episode = Episode(title: episodeTitle, series: seriesTitle, season: season, number: number)
            episodes.append(episode)
        }
    }
    
}
