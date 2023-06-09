//
//  BoulderingView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 4/20/23.
//

import SwiftUI

struct BoulderingView: View {
    @State private var isShowing = false
    var body: some View {
        NavigationView{
            ZStack {
                if isShowing{
                    SideMenuView(isShowing: $isShowing)
                }
                BoulderHomeView()
                    .cornerRadius(isShowing ? 30 : 10)
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()){
                            isShowing.toggle()
                        }
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                    }))
                    .navigationTitle("Bouldering")
                
            }
        }
    }
}

struct BoulderingView_Previews: PreviewProvider {
    static var previews: some View {
        BoulderingView()
            
    }
}

struct BoulderHomeView: View {
    var body: some View {
        ZStack{
            VStack{
                NavigationLink {
                    LogBetaHomeView()
                    
                } label: {
                    Text("Log Beta")
                        .bold()
                        .frame(width: 200, height: 130)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
                .padding()
                NavigationLink {
                    BoulderLogView()
                    
                } label: {
                    Text("Log Entries")
                        .bold()
                        .frame(width: 200, height: 130)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }

            }
        }
        
        .navigationBarTitleDisplayMode(.inline)
    }
}
