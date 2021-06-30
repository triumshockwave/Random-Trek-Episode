//
//  Series.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/30/21.
//

import Foundation

struct Series {
    var episodes: [Episode]
    
    mutating func add(episode: Episode) {
        episodes.append(episode)
    }
}
