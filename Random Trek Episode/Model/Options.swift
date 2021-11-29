//
//  Options.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/29/21.
//

import Foundation

class Options: ObservableObject {
        
    @Published var seriesList: [Series] = []
    
    init() {
        self.seriesList.append(Series(seriesTitle: "The Original Series", abbreviation: "TOS", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "The Animated Series", abbreviation: "TAS", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "The Next Generation", abbreviation: "TNG", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "Deep Space Nine", abbreviation: "DS9", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "Voyager", abbreviation: "VOY", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "Enterprise", abbreviation: "ENT", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "Discovery", abbreviation: "DSC", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "Picard", abbreviation: "PIC", isSelected: true, episodes: []))
        self.seriesList.append(Series(seriesTitle: "Lower Decks", abbreviation: "LD", isSelected: true, episodes: []))
    }
    
    func saveDefaults() {
        let defaults = UserDefaults.standard
        for i in self.seriesList.indices {
            let currentSeries = self.seriesList[i]
            let key = currentSeries.abbreviation
            defaults.set(currentSeries.isSelected, forKey: key)
        }
    }
    
    func loadDefaults() {
        let defaults = UserDefaults.standard
        for i in self.seriesList.indices {
            let currentSeries = self.seriesList[i]
            let key = currentSeries.abbreviation
            let savedValue = defaults.bool(forKey: key)
            currentSeries.isSelected = savedValue
        }
    }
}
