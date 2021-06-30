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
    
    @State private var series = "Star Trek"
    @State private var season = 1
    @State private var episodeNumber = 1
    @State private var title = "The Man Trap"
    
    @State private var number = Int.random(in: 0...9999)
    @State private var enabledSeriesString: String = ""
    
    func generateRandomEpisode() {
        number = Int.random(in: 0...9999)
        
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
    }
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(series)
                        .font(.title)
                        .fontWeight(.black)
                    Text("Season \(String(season))")
                    Text("Episode \(String(episodeNumber))")
                    Text(title)
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
                if UIDevice.current.userInterfaceIdiom == .phone {
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: { self.presentation.wrappedValue.dismiss() }) {
                            Image(systemName: "gear")
                                .resizable()
                                .foregroundColor(Color.primary)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
            }

            Divider()
            Text("Random Number: \(String(number))")
            Text("Enabled Series: \(enabledSeriesString)")
        }
        .padding()
        .navigationTitle(Text("Result"))
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            ResultView().navigationBarHidden(true)
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.dark)

        NavigationView() {
            ResultView().navigationBarHidden(true)
        }
        .previewDevice("iPhone 12")
        .preferredColorScheme(.light)
    }
}
