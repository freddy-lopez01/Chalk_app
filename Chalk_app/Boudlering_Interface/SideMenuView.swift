//
//  SideMenuView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 5/7/23.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                // Header
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 240)
                
                //Cell Items
                ForEach(0..<4){ _ in
                    SideMenuOptionView()
                    
                    
                }
                Spacer()
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
