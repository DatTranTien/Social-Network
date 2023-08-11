//
//  FeedCell.swift
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading){
                
                HStack{
                    Image("pp")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading){
                        Text("lucifer")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        Text("active - 7 hr late")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
                
                ZStack{
                    // comment & icon
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Image("comment")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .shadow(color: .black, radius: 3, x: 1, y: 1)
                            Image("smile")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .shadow(color: .black, radius: 3, x: 1, y: 1)
                                .padding(.top,15)
                        }
                        .padding(.trailing,20)
                        .padding(.bottom, 50)
                    }
                }.zIndex(1)
                    
                    //main image & text comment
                VStack{
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                    
                    HStack{
                        Text("Add a comment...")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                            .padding(.leading,4)
                        Spacer()
                    }
                }
                
                    // small image
                VStack{
                    HStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.black)
                            .frame(width: 125, height: 165, alignment: .center)
                            .overlay(
                                Image("front")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 160, alignment: .center).cornerRadius(8)
                            )
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.top,18)
                    Spacer()
                }
                    
                    
            }
            }.frame(width: UIScreen.main.bounds.width, height: 600)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
