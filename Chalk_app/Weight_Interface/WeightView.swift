//
//  WeightView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 4/20/23.
//

import SwiftUI

struct WeightView: View {
    @State private var isShowing = false
    var body: some View {
        NavigationView{
            ZStack {
                if isShowing{
                    SideMenuView(isShowing: $isShowing)
                }
                WeightHomeView()
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
                    .navigationTitle("Weightlifting")
                
            }
        }
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}


struct WeightHomeView: View{
    var body: some View{
        ZStack{
            Image("Weight_back")
            VStack{
                //Image("Weight_back")
                Button {
                    
                    
                    
                } label: {
                    Text("Search Workout")
                        .frame(width: 200, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                    
                }
                .padding()
                
                Button {
                    
                } label: {
                    Text("Log workout")
                        .frame(width: 200, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
                .padding()
                    
                Button {
                    
                } label: {
                    Text("Calender")
                        .frame(width: 200, height: 50)
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                    
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.white)
    }
}
