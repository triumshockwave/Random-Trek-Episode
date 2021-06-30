//
//  ContentView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var applicationOptions: Options
    
    @State private var tosState = true
    @State private var tasState = true
    @State private var tngState = true
    @State private var ds9State = true
    @State private var voyState = true
    @State private var entState = true
    @State private var dscState = true
    @State private var picState = true
    @State private var ldState = true
    @State private var isShowingResult = true
    
    init() {
        if UIDevice.current.userInterfaceIdiom == .phone {
            isShowingResult = false
        }
    }
    
    var body: some View {
        NavigationView() {
            VStack() {
                Text("Random Trek Episode")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Form() {
                    Section(header: Text("Series Selection")) {
                        Toggle(isOn: $applicationOptions.tosSelected) {
                            Text("TOS")
                        }
                        Toggle(isOn: $applicationOptions.tasSelected) {
                            Text("TAS")
                        }
                        Toggle(isOn: $applicationOptions.tngSelected) {
                            Text("TNG")
                        }
                        Toggle(isOn: $applicationOptions.ds9Selected) {
                            Text("DS9")
                        }
                        Toggle(isOn: $applicationOptions.voySelected) {
                            Text("VOY")
                        }
                        Toggle(isOn: $applicationOptions.entSelected) {
                            Text("ENT")
                        }
                        Toggle(isOn: $applicationOptions.dscSelected) {
                            Text("DSC")
                        }
                        Toggle(isOn: $applicationOptions.picSelected) {
                            Text("PIC")
                        }
                        Toggle(isOn: $applicationOptions.ldSelected) {
                            Text("LD")
                        }
                    }
                }
                .navigationTitle(Text("Settings"))
                .navigationBarHidden(false)
                
                NavigationLink(destination: ResultView(), isActive: $isShowingResult) {
                    if !isShowingResult {
                        Button(action: { isShowingResult.toggle() }) {
                            Text("Engage")
                                .padding()
                                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                .clipShape(Capsule())
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
        }
        .padding()
        .navigationBarHidden(false)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Episode(title: "The Man Trap", series: "Star Trek", season: 1, number: 1))
            .environmentObject(Options())
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
        SettingsView()
            .environmentObject(Episode(title: "The Man Trap", series: "Star Trek", season: 1, number: 1))
            .environmentObject(Options())
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
    }
}
