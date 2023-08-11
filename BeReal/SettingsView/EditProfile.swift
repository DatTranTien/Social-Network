//
//  EditProfile.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

@available(iOS 15.0, *)
struct EditProfile: View {
    @State var width = UIScreen.main.bounds.width
    @State var fullname = ""
    @State var username = ""
    @State var bio = ""
    @State var location = ""
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    HStack{
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Cancel").foregroundColor(.white)
                        })
                        Spacer()
                        Text("Save").foregroundColor(.gray)
                    }.padding(.horizontal,width*0.05)
                    Text("Edit Profile").foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                HStack{
                 Spacer()
                    Rectangle().frame(width: width*0.95,height: 0.7)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                Spacer()
            }
            
            VStack{
            VStack{
                ZStack(alignment: .bottomTrailing){
//                    Image("pp").resizable().scaledToFit().frame(width: 120,height: 120).cornerRadius(60)
                    Circle()
                        .frame(width: 130, height: 130)
                        .cornerRadius(75)
                        .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                        .overlay(
                            Text(viewModel.currentUser!.name.prefix(1).uppercased())
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                        )
                    
                    ZStack{
                        ZStack{
                            Circle().frame(width: 34,height: 34)
                                .foregroundColor(.black)
                            Circle().frame(width: 30,height: 30)
                                .foregroundColor(.white)
                            Circle().frame(width: 30,height: 30)
                                .foregroundColor(.black).opacity(0.1)
                        }
                        Image(systemName: "camera.fill")
                            .font(.system(size: 16))
                            .shadow(color: .white, radius: 1,x:1,y:1)
                    }
                }
            }
            
            VStack{
                Rectangle().frame(width: width*0.9,height: 0.7)
                    .foregroundColor(.gray)
                    .opacity(0.3)
                
                HStack{
                    HStack{
                        Text("Full Name").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                    }.frame(width: width*0.22)
                    HStack{
                     TextField("",text: $fullname)
                            .font(.system(size: 16))
                            .placeholder(when: fullname.isEmpty){
                                Text("Cem").foregroundColor(.white)
                                    .font(.system(size: 16))
                            }.foregroundColor(.white)
                            .padding(.leading,width*0.05)
                        Spacer()
                    }.frame(width: width*0.63)
                }
                
                
                Rectangle().frame(width: width*0.9,height: 0.7)
                    .foregroundColor(.gray)
                    .opacity(0.3)
                
                HStack{
                    HStack{
                        Text("User Name").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                    }.frame(width: width*0.22)
                    HStack{
                     TextField("",text: $username)
                            .font(.system(size: 16))
                            .placeholder(when: fullname.isEmpty){
                                Text("Cemuser").foregroundColor(.white)
                                    .font(.system(size: 16))
                            }.foregroundColor(.white)
                            .padding(.leading,width*0.05)
                        Spacer()
                    }.frame(width: width*0.63)
                }
                
                
                Rectangle().frame(width: width*0.9,height: 0.7)
                    .foregroundColor(.gray)
                    .opacity(0.3)
                
                HStack(alignment: .top){
                    HStack{
                     Text("Bio")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            Spacer()
                        
                    }.padding(.leading,-4)
                        .frame(width: width*0.2)
                    
                    if #available(iOS 16, *){
                        TextEditor(text: $bio).foregroundColor(.white).background(.black).scrollContentBackground(.hidden)
                            .frame(height: 100)
                            .padding(.leading,width*0.05)
                            .overlay(
                                VStack{
                                    HStack{
                                        if bio.isEmpty{
                                            Text("Bio").foregroundColor(.gray)
                                                .font(.system(size: 16))
                                                .zIndex(1)
                                                .padding(.top,8)
                                                .padding(.leading,24)
                                        }
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            ).padding(.top,-8)
                            .frame(width:width*0.63)
                    }
                }
                Rectangle().frame(width: width*0.9,height: 0.7)
                    .foregroundColor(.gray)
                    .opacity(0.3)
                
                HStack{
                    HStack{
                        Text("Location").foregroundColor(.white).font(.system(size: 16))
                        Spacer()
                    }.frame(width: width*0.22)
                    HStack{
                     TextField("",text: $fullname)
                            .font(.system(size: 16))
                            .placeholder(when: fullname.isEmpty){
                                Text("Location").foregroundColor(.gray)
                                    .font(.system(size: 16))
                            }.foregroundColor(.white)
                            .padding(.leading,width*0.05)
                        Spacer()
                    }.frame(width: width*0.63)
                }
            }.padding(.horizontal,width*0.05)
                    .padding(.top,24)
                Spacer()
            }.padding(.top,UIScreen.main.bounds.height*0.08)
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            EditProfile()
        } else {
            // Fallback on earlier versions
        }
    }
}
