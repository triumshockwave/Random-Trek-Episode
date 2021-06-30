//
//  SettingsView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/28/21.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var applicationOptions: Options
    @State private var chosenEpisode = Episode(title: "The Man Trap", series: "Star Trek", season: 1, number: 1)
    
//    @State private var series = "Star Trek"
//    @State private var season = 1
//    @State private var episodeNumber = 1
//    @State private var title = "The Man Trap"
        
    func generateRandomEpisode() {
        
        #if DEBUG
        let number = Int.random(in: 0...9999)
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
    }
    
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
                Spacer()
            }
            Spacer()
            ZStack() {
                Button(action: { generateRandomEpisode() }) {
                    Text("Engage")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
//                if UIDevice.current.userInterfaceIdiom == .phone {
//                    HStack(alignment: .center) {
//                        Spacer()
//                        Button(action: { self.presentation.wrappedValue.dismiss() }) {
//                            Image(systemName: "gear")
//                                .resizable()
//                                .foregroundColor(Color.primary)
//                                .frame(width: 30, height: 30)
//                        }
//                    }
//                }
            }
        }
        .padding()
        .navigationTitle(Text("Your Mission:"))
    }
}

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
