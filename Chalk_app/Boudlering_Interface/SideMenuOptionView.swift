//
//  SideMenuOptionView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 5/7/23.
//

import SwiftUI


struct SideMenuOptionView: View {
    var body: some View {
        HStack (spacing: 16){
            Image(systemName: "gear")
                .frame(width: 24, height: 24)
            Text("Settings")
                .font(.system(size: 15, weight: .semibold))
            Spacer()
        }
        .foregroundColor(.black)
        .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView()
    }
}
