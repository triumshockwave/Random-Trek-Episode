//
//  ContentView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var TOS = true
    @State private var TNG = true
    @State private var DS9 = true
    @State private var VOY = true
    @State private var DSC = true
    
    var body: some View {
        NavigationView() {
            VStack() {
                Group {
                    Form() {
                        Toggle(isOn: $TOS) {
                            Text("TOS")
                        }
                        Toggle(isOn: $TNG) {
                            Text("TNG")
                        }
                        Toggle(isOn: $DS9) {
                            Text("DS9")
                        }
                        Toggle(isOn: $VOY) {
                            Text("VOY")
                        }
                        Toggle(isOn: $DSC) {
                            Text("DSC")
                        }
                    }
                    Button(action: {}) {
                        Text("Engage")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Random Trek Episode")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
