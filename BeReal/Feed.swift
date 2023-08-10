//
//  Feed.swift
//  BeReal
//
//  Created by Tran tien dat on 16/07/2023.
//

import SwiftUI

struct Feed: View {
    @Binding var mainMenu : String
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
        ZStack{
            
            ScrollView{
            VStack{
                VStack{
                    ZStack{
                        VStack(alignment: .leading){
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(5)
                        }
                        VStack{
                            HStack{
                                Image("front")
                                    .resizable()
                                    .scaledToFit()
                                    .border(.black)
                                    .cornerRadius(2)
                                    .frame(width: 50, height: 50)
                                    .padding(.leading)
                                Spacer()
                            }
                            .padding(.top, 48)
                            Spacer()
                        }
                    }
                    .frame(width: 100)
                    
                    VStack{
                     Text("Add a caption ...")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Text("View Comment")
                            .foregroundColor(.gray)
                        
                        HStack{
                         Text("Messi - 1 hr late")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                            ThreeDots(size: 3, color: .gray)
                        }
                    }
                    
                    ForEach(1..<8){_ in
                        FeedCell()
                    }
                }
                Spacer()
            }.padding(.top,100)
        }
            
            
            VStack{
            VStack{
                HStack{
                    Button(action: {
                        withAnimation{
                            self.mainMenu="left"
                        }
                    }, label: {
                        Image(systemName: "person.2.fill")
                            .foregroundColor(.white)
                    })
                    Spacer()
                    Text("BeReal.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                    Spacer()
                    Button(action: {
                        withAnimation{
                            self.mainMenu="profile"
                        }}, label: {
                            Circle().frame(width: 35, height: 35)
                                .cornerRadius(17.5)
                                .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                .overlay(
                                    Text((viewModel.currentUser!.name.prefix(1).uppercased()))
                                        .foregroundColor(.white)
                                        .font(.system(size: 15))
                                )
//                        Image("pp")
//                            .resizable()
//                            .frame(width: 35, height: 35, alignment: .center)
//                            .cornerRadius(17.5)
                    })
                }
                .padding(.horizontal)
                
                HStack{
                    Text("My Friend")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    Text("Discovery")
                        .foregroundColor(.gray)
                }
            }
                Spacer()
        }
        }
    }
}
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed(mainMenu: .constant("feed"))
    }
}
