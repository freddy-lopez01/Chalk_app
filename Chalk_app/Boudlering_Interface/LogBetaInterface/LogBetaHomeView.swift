//
//  LogBetaHomeView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 5/12/23.
//

import SwiftUI

struct LogBetaHomeView: View {
    @State private var BetaDiscriptor: String = ""
    var body: some View {
        ZStack{
            VStack{
                //Text("Picture of most recent beta photo log")
                Button{
                    print("trying to upload photo")
                }label: {
                    Label("Upload Photo", systemImage: "camera")
                }
                    
                
                .padding([.trailing])
                HStack{
                    Text("Select V grade")
                        .padding()
                    Menu{
                        Button(action: { }, label: {
                            Text("V1")
                        })
                        Button(action: { }, label: {
                            Text("V2")
                        })
                        Button(action: { }, label: {
                            Text("V3")
                        })
                        Button(action: { }, label: {
                            Text("V4")
                        })
                        Button(action: { }, label: {
                            Text("V5")
                        })
                        Button(action: { }, label: {
                            Text("V6")
                        })
                        Button(action: { }, label: {
                            Text("V7")
                        })
                        Button(action: { }, label: {
                            Text("V8")
                        })
                        Button(action: { }, label: {
                            Text("V9")
                        })
                        Button(action: { }, label: {
                            Text("V10")
                        })
                        
                    } label: {
                        Label(
                            title: {Text("Options")},
                            icon: {Image(systemName: "plus")}
                        )
                    }
                }
                .padding(.leading, -150.0)

                HStack{
                    Text("Beta Description")
                        .padding(.leading, 20.0)
                    
                    TextField("details",
                              text: $BetaDiscriptor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 20)
                }
                
                    
            }
        }
    }
}

struct LogBetaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        LogBetaHomeView()
    }
}
