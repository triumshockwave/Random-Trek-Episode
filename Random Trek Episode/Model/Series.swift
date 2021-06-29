//
//  Series.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import Foundation

class Series: ObservableObject {
    var name: String
    var seasons: Int
    var enabled: Bool
    
    init(name: String, seasons: Int, enabled: Bool = true) {
        self.name = name
        self.seasons = seasons
        self.enabled = enabled
    }
}
