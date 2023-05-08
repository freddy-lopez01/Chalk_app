//
//  ContentView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 4/16/23.
//

import SwiftUI

struct HomeView: View {
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
                    //Button(action: {
                        // Open up bouldering page
                    //}, label: {
                    //    Image("Bouldering_button")
                    //})
                    
                    Button(action: {
                         //Open up Weightligting page
                    }, label:{
                       Image("Weight_button")
                    }).padding(20)
                    
                    Spacer()
                }
            }
        }
    }
}




struct ContentView2: View{
    var body: some View{
        
        Text("Second Page")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        ContentView2()
    }
}
