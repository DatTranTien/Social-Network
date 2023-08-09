//
//  MemoriesView.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

struct MemoriesView: View {
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
                VStack{
                    HStack{
                     Text("Your memories are activated")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                        Spacer()
                    }
                    Text("Memories of Buckeye Lake, over view of the Amusement Park")
                        .foregroundColor(.white)
                        .padding(.top,-2)
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .frame(height: 210)
                        .foregroundColor(Color(red: 22/255, green: 4/255, blue: 3/255))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.red,lineWidth: 1)
                        )
                    VStack(alignment: .leading){
                        HStack{
                         Text("Deactive and Delete Memories")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        VStack{
                            HStack{
                             Text("The Memories feature in the Photos app  creates a personalized collection of photos and videos that are set to music and you watch like a movie.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                                Spacer()
                            }
                            HStack{
                                Text("The Memories feature in the Photos app  creates a personalized collection of photos and videos that are set to music and you watch like a movie.")
                                       .foregroundColor(.white)
                                       .font(.system(size: 14))
                                Spacer()
                            }
                        }.padding(.top,-6)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: UIScreen.main.bounds.width*0.5,height: 40)
                            .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
                            .overlay(
                               Text("Deactive Memories")
                                .foregroundColor(.red)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                            ).padding(.top,8)
                        
                    }.padding(.leading)
                }.padding(.top,22)
                Spacer()
            }.padding(.horizontal)
                .padding(.top,50)
        }
    }
}

struct MemoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MemoriesView()
    }
}
