//
//  Episode.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import Foundation

struct Episode {
    var title: String
    var series: String
    var season: Int
    var number: Int
    
    init(title: String, series: String, season: Int, number: Int) {
        self.title = title
        self.series = series
        self.season = season
        self.number = number
    }
}
