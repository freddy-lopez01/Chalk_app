//
//  LogBetaHomeView.swift
//  Chalk_app
//
//  Created by Freddy Lopez on 5/12/23.
//

import SwiftUI

//class betaInfo: Identifiable, Codable{
//    let id = UUID()
//    let descriptorString = ""
//    let vgradeSelect = "V-Grade"
//    let startMove = "startMove"
//    let climeDate = Date()
//
//    init(descriptorString: String, vgadeSelecr: String, startMove: String, date: Date) {
//        self.id = UUID()
//        self.descriptorString = descriptorString
//        self.vgradeSelect = vgadeSelect
//        self.startMove = startMove
//        self.climeDate = climeDate
//    }
//}

struct LogBetaHomeView: View {
    //@ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    @State private var keyboardHeight: CGFloat = 0
    @State var BetaDiscriptor: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @State var descriptorString: String = ""
    
    @State var vgradeSelect = "V-Grade"
    @State var startMove = "startMove"
    @State var climbDate = Date()
    
    var body: some View {
        ZStack{
            VStack{
                Image("picHolder")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 50)
                
                //Text("Picture of most recent beta photo log")
                Button{
                    print("trying to upload photo")
                }label: {
                    Label("Upload Photo", systemImage: "camera")
                }
                .padding(.top, 40)
                
                Form{
                    Section(header: Text("Climb Description")){
                        TextField("Beta Description", text: $descriptorString)
                        
                    }
                    Section(header: Text("Select V-Grade")){
                        Menu{
                            Button(action: {
                                vgradeSelect = "V1"
                            }, label: {
                                Text("V1")
                            })
                            Button(action: {
                                vgradeSelect = "V2"
                            }, label: {
                                Text("V2")
                            })
                            Button(action: {
                                vgradeSelect = "V3"
                            }, label: {
                                Text("V3")
                            })
                            Button(action: {
                                vgradeSelect = "V4"
                            }, label: {
                                Text("V4")
                            })
                            Button(action: {
                                vgradeSelect = "V5"
                            }, label: {
                                Text("V5")
                            })
                            Button(action: {
                                vgradeSelect = "V6"
                            }, label: {
                                Text("V6")
                            })
                            Button(action: {
                                vgradeSelect = "V7"
                            }, label: {
                                Text("V7")
                            })
                            Button(action: {
                                vgradeSelect = "V8"
                            }, label: {
                                Text("V8")
                            })
                            Button(action: {
                                vgradeSelect = "V9"
                            }, label: {
                                Text("V9")
                            })
                            Button(action: {
                                vgradeSelect = "V10"
                            }, label: {
                                Text("V10")
                            })
    
                        } label: {
                            Label(
                                title: {Text("\(vgradeSelect)")},
                                icon: {Image(systemName: "plus")}
                            )
                        }
                    }
                    Section(header: Text("Static/Dynamic Start")){
                        Menu{
                            Button(action: {
                                startMove = "Static"
                            }, label: {
                                Text("Static")
                            })
                            Button(action: {
                                startMove = "Dynamic"
                            }, label: {
                                Text("Dynamic")
                            })
                        } label: {
                            Label(
                                title: {Text("\(startMove)")},
                                icon: {Image(systemName: "plus")}
                                )
                        }
                    }
                    
                    Section(header: Text("Climb Date")){
                        DatePicker("Select Date", selection: $climbDate,displayedComponents: .date)
                    }
                }
             
                Button("Save Climb"){
                    UserDefaults.standard.set(descriptorString, forKey: "TEXT_KEY")
                    BetaDiscriptor = descriptorString
                    print("Saved Climb \(descriptorString)")
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



