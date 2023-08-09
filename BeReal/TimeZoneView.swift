//
//  TimeZoneView.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

struct TimeZoneView: View {
    @State var width = UIScreen.main.bounds.width
    @State var area = "europe"
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    Text("Time Zone")
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
                     Text("Select your time zone")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Spacer()
                    }
                    
                    HStack{
                        Text("TIMEZONE Lyrics: You're wearing my old clothes, but you, you wear it better / And every time I see your face, the moon should be jealous").foregroundColor(.white)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        Spacer()
                    }
                }.padding(.top,-8)
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 14).frame(width: UIScreen.main.bounds.width*0.9,height: 190).foregroundColor(Color.white)
                            .opacity(0.07)
                        VStack{
                            Button(action: {self.area="europe"}, label: {
                                HStack{
                                 Image(systemName: "globe.europe.africa.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("Europe")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    if area=="europe"{
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14))
                                    }
                                }.padding(.horizontal,UIScreen.main.bounds.width*0.05).frame(height: 30)
                            })
                            HStack{
                             Spacer()
                                
                                Rectangle().frame(width: UIScreen.main.bounds.width*0.8,height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)
                            }
                            
                            Button(action: {self.area="americas"}, label: {
                                HStack{
                                 Image(systemName: "globe.americas.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("Americas")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    if area=="americas"{
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14))
                                    }
                                }.padding(.horizontal,UIScreen.main.bounds.width*0.05).frame(height: 30)
                            })
                            HStack{
                             Spacer()
                                
                                Rectangle().frame(width: UIScreen.main.bounds.width*0.8,height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)
                            }
                            
                            
                            
                            Button(action: {self.area="eastasia"}, label: {
                                HStack{
                                 Image(systemName: "globe.asia.australia.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("East Asia")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    if area=="eastasia"{
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14))
                                    }
                                }.padding(.horizontal,UIScreen.main.bounds.width*0.05).frame(height: 30)
                            })
                            HStack{
                             Spacer()
                                
                                Rectangle().frame(width: UIScreen.main.bounds.width*0.8,height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)
                            }
                            
                            
                            Button(action: {self.area="westasia"}, label: {
                                HStack{
                                 Image(systemName: "globe.asia.australia.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("West Asia")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    if area=="westasia"{
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14))
                                    }
                                }.padding(.horizontal,UIScreen.main.bounds.width*0.05).frame(height: 30)
                            })
                        }
                    }.padding(.top)
                }
                Spacer()
                Button(action: {}, label: {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: UIScreen.main.bounds.width*0.9, height: 45)
                        .foregroundColor(Color(red: 86/255, green: 86/255, blue: 88/255))
                        .overlay(
                           Text("Save")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                        )
                })
            }.padding(.horizontal).padding(.top,50)
            
            
            
        }
    }
}

struct TimeZoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimeZoneView()
    }
}
