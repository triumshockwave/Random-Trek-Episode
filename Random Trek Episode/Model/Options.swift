//
//  Options.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/29/21.
//

import Foundation

class Options: ObservableObject {
    
    @Published var tosSelected = true
    @Published var tasSelected = true
    @Published var tngSelected = true
    @Published var ds9Selected = true
    @Published var voySelected = true
    @Published var entSelected = true
    @Published var dscSelected = true
    @Published var picSelected = true
    @Published var ldSelected  = true
    
    @Published var seriesList: [Series] = [
        Series(seriesTitle: "The Original Series", abbreviation: "TOS", isSelected: true, episodes: []),
        Series(seriesTitle: "The Animated Series", abbreviation: "TAS", isSelected: true, episodes: []),
        Series(seriesTitle: "The Next Generation", abbreviation: "TNG", isSelected: true, episodes: []),
        Series(seriesTitle: "Deep Space Nine", abbreviation: "DS9", isSelected: true, episodes: []),
        Series(seriesTitle: "Voyager", abbreviation: "VOY", isSelected: true, episodes: []),
        Series(seriesTitle: "Enterprise", abbreviation: "ENT", isSelected: true, episodes: []),
        Series(seriesTitle: "Discovery", abbreviation: "DSC", isSelected: true, episodes: []),
        Series(seriesTitle: "Picard", abbreviation: "PIC", isSelected: true, episodes: []),
        Series(seriesTitle: "Lower Decks", abbreviation: "LD", isSelected: true, episodes: [])
    ]
}
