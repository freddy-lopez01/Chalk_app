//
//  ContentView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 4/16/23.
//

import SwiftUI

struct HomeView: View {
    @State private var BoulderingViewState: Bool = false // created a State var in order to keep track of which page the user is currently in the application
        
        //Still gotta figure out just how this can be achieved while using the NavigationLink() format of navigation
    var body: some View {
        NavigationView{
            ZStack{
                Image("Background")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image("logo")
                        .padding(.bottom, 250.0)
                    // Buttons for switching UI
                    
                    
                    NavigationLink(destination: BoulderingView()) {
                        Image("Bouldering_button")
                    }
                    NavigationLink(destination: WeightView()) {
                        Image("Weight_button")
                    }
                    
                    Spacer()
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
