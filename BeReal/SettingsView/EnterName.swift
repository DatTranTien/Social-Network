//
//  EnterName.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI

struct EnterName: View {
    @State var textName = ""
    @State var buttonActive = false
    @Binding var nameButtonClicked: Bool
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    Text("BeReal")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }.padding(.horizontal)
                Spacer()
            }
            VStack{
            VStack(alignment: .center, spacing: 8){
                Text("Let's get started, what's your name?")
                    .fontWeight(.heavy)
                    .font(.system(size: 16))
                
                Text("Your name")
                    .foregroundColor(Color(red: 70/255, green: 70/255, blue: 73/255))
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                    .frame(width: 210)
                    .overlay(
                       TextField("",text: $textName)
                        .font(.system(size: 40,weight: .heavy))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    )
            }.foregroundColor(.white)
                Spacer()
            }.padding(.top,50)
                
            VStack{
             Spacer()
                Button(action: {
                    if buttonActive {
                        self.nameButtonClicked = true
                    }else {
                        self.buttonActive = true
                    }
                }, label: {
                    WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                        .onChange(of: textName){
                            newValue in
                            if !newValue.isEmpty {
                                buttonActive = true
                            }else if newValue.isEmpty {
                                buttonActive = false
                            }
                        }
                })
            }
        }
    }
}

//struct EnterName_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterName()
//    }
//}
