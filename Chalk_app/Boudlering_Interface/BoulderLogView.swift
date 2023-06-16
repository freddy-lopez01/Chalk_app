//
//  BoulderLogView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 6/14/23.
//

import SwiftUI

struct BoulderLogView: View {
    var body: some View {
        VStack {
            NavigationView{
                Text("Climbs by V-grade")
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color.gray)
                    .cornerRadius(15)
                
                
                .navigationTitle("Logged Climbs")
                .navigationBarTitleDisplayMode(.inline)
                    
            }
            Text("V4")
            .padding(.trailing, 300)
            List{
                Text("06/12/23 Dynamic")
                Text("06/12/23 Dynamic")
            }
            Text("V5")
            .padding(.trailing, 300)
            List{
                Text("06/14/23 Static")
                Text("06/12/23 Dynamic")
            }
            
            Text("V5")
            .padding(.trailing, 300)
            List{
                Text("06/13/23 Dynamic")
            }
        }
    }
}

struct BoulderLogView_Previews: PreviewProvider {
    static var previews: some View {
        BoulderLogView()
    }
}
