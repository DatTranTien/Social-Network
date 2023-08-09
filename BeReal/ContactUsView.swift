//
//  ContactUsView.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

struct ContactUsView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    Text("How can we help you?")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                    }
                }.padding(.horizontal)
                Spacer()
            }
            
            VStack{
                VStack(spacing:28){
                    ZStack(alignment:.center){
                        RoundedRectangle(cornerRadius :10)
                            .frame(height:45)
                            .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                        
                        HStack{
                         Image(systemName: "questionmark.circle")
                            Text("Ask a question")
                        }.foregroundColor(.white)
                    }
                    ZStack(alignment:.center){
                        RoundedRectangle(cornerRadius :10)
                            .frame(height:45)
                            .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                        
                        HStack{
                         Image(systemName: "ladybug")
                            Text("Reqport a problem")
                        }.foregroundColor(.white)
                    }
                    ZStack(alignment:.center){
                        RoundedRectangle(cornerRadius :10)
                            .frame(height:45)
                            .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                        
                        HStack{
                         Image(systemName: "atom")
                            Text("Become a BA Tester")
                        }.foregroundColor(.white)
                    }
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top,80)
            }
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
