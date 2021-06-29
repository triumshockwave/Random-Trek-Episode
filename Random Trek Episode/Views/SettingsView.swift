//
//  ContentView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import SwiftUI

struct SettingsView: View {
    @State private var tosState = true
    @State private var tngState = true
    @State private var ds9State = true
    @State private var voyState = true
    @State private var entState = true
    @State private var dscState = true
    @State private var picState = true
    @State private var ldState = true
    
    @State private var isShowingResult = true
    
    var body: some View {
        NavigationView() {
            VStack() {
                Text("Random Trek Episode")
                Form() {
                    Section(header: Text("Series Selection")) {
                        Toggle(isOn: $tosState) {
                            Text("TOS")
                        }
                        Toggle(isOn: $tngState) {
                            Text("TNG")
                        }
                        Toggle(isOn: $ds9State) {
                            Text("DS9")
                        }
                        Toggle(isOn: $voyState) {
                            Text("VOY")
                        }
                        Toggle(isOn: $entState) {
                            Text("ENT")
                        }
                        Toggle(isOn: $dscState) {
                            Text("DSC")
                        }
                        Toggle(isOn: $picState) {
                            Text("PIC")
                        }
                        Toggle(isOn: $ldState) {
                            Text("LD")
                        }
                    }
                    Button(action: { isShowingResult.toggle() }) {
                        Text("Show/Hide Result")
                    }
                }
                .navigationTitle(Text(""))
                .navigationBarHidden(true)
            }
            NavigationLink(destination: ResultView().navigationBarHidden(true), isActive: $isShowingResult) { EmptyView() }
        }
        .padding()
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
        SettingsView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
    }
}
