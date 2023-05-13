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
                Text("Picture of most recent beta photo log")
                .padding()
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
