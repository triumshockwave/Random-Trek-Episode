//
//  SettingsView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/28/21.
//

import SwiftUI

struct ResultView: View {
    @State private var TOS = true
    @State private var TNG = true
    @State private var DS9 = true
    @State private var VOY = true
    @State private var DSC = true
    
    var body: some View {
        Text("Hello World")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .preferredColorScheme(.dark)
    }
}
