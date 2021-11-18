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
    
    @Published var seriesList: [String:Series] = [
        "TOS": Series(seriesTitle: "The Original Series", abbreviation: "TOS", isSelected: true, episodes: []),
        "TAS": Series(seriesTitle: "The Animated Series", abbreviation: "TAS", isSelected: true, episodes: []),
        "TNG": Series(seriesTitle: "The Next Generation", abbreviation: "TNG", isSelected: true, episodes: []),
        "DS9": Series(seriesTitle: "Deep Space Nine", abbreviation: "DS9", isSelected: true, episodes: []),
        "VOY": Series(seriesTitle: "Voyager", abbreviation: "VOY", isSelected: true, episodes: []),
        "ENT": Series(seriesTitle: "Enterprise", abbreviation: "ENT", isSelected: true, episodes: []),
        "DSC": Series(seriesTitle: "Discovery", abbreviation: "DSC", isSelected: true, episodes: []),
        "PIC": Series(seriesTitle: "Picard", abbreviation: "PIC", isSelected: true, episodes: []),
        "LD":  Series(seriesTitle: "Lower Decks", abbreviation: "LD", isSelected: true, episodes: [])
    ]
}
