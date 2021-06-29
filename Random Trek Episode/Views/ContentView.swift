//
//  ContentView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var tosState = true
    @State private var tngState = true
    @State private var ds9State = true
    @State private var voyState = true
    @State private var entState = true
    @State private var dscState = true
    @State private var picState = true
    @State private var ldState = true
    
    var body: some View {
        NavigationView() {
            VStack() {
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
                    NavigationLink(destination: ResultView()) {
                        Text("Engage")
                            .frame(maxWidth: .infinity)
                    }
                }
                .navigationTitle(Text("Setup"))
            }
        }
        .padding()
        .navigationTitle("Random Trek Episode")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
    }
}
