//
//  ContentView.swift
//  Random Trek Episode
//
//  Created by Brent Amersbach on 6/27/21.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    
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
    @State private var isShowingResult = false
    
    //MARK: - App Logic Methods
    
    func toggleAllOn() {
        
    }
    
    //MARK: - View hierarchy
    
    var body: some View {
        NavigationView() {
            VStack() {                    
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
                    Section(header: Text("Toggle All")) {
                        HStack() {
                            Spacer()
                            Button(action: {}) {
                                Text("On")
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                            .clipShape(Capsule())
                            
                            Spacer()
                            
                            Button(action: {}) {
                                Text("Off")
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                            .clipShape(Capsule())
                            
                            Spacer()
                        }

                    }
                }
                .navigationTitle(Text("LCARS Access"))
                .navigationBarHidden(false)
                                
                NavigationLink(destination: ResultView()
                                .environmentObject(applicationOptions), isActive: $isShowingResult) {
                    if !isShowingResult {
                        Button(action: { isShowingResult.toggle() }) {
                            Text("Show Result")
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
        .onAppear() {
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                isShowingResult = false
            } else {
                isShowingResult = true
            }
        }
        .padding()
        .navigationBarHidden(false)
    }
}

//MARK: - Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Options())
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
        SettingsView()
            .environmentObject(Options())
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12")
    }
}
