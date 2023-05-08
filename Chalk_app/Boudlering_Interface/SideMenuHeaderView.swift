//
//  SideMenuHeaderView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 5/7/23.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Button(action:{
                isShowing.toggle()
            },
                   label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.black)
                    .padding()
            })

            VStack (alignment: .leading) {
                Image("user-profile")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Freddy Lopez")
                    .font(.system(size: 24, weight: .semibold))
                Text("@freddylopez20")
                    .font(.system(size: 14))
                

                
                
            }
            .padding(.trailing, 200.0)
        .frame(maxWidth: .infinity, alignment: .bottom)
        }
        
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
