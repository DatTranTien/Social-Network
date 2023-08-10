//
//  EnterAgeView.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI
import Combine

struct EnterAgeView: View {
    @State var day = ""
    @State var month = ""
    @State var year = ""
    @State var ageButtonClicked = false
    @State var buttonActive = false
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
            
            VStack(alignment: .center, spacing: 8){
                Text("Hi, when's your birthday?")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 16))
                
                HStack{
                    Text("MM").foregroundColor(month.isEmpty ?Color(red: 70/255, green: 70/255, blue: 73/255): Color.black)
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .frame(width: 72)
                        .overlay(
                            TextField("", text: $month)
                                .foregroundColor(.white)
                                .font(.system(size: 45,weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onReceive(Just(month), perform: {
                                    newValue in
                                    let filterd = newValue.filter{
                                        Set("0123456789").contains($0)
                                    }
                                    if filterd != newValue {
                                        self.month = filterd
                                    }
                                })
                                .onReceive(Just(month), perform: {
                                    _ in
                                    if month.count > 2 {
                                        month = String(month.prefix(2))
                                    }
                                })
                            
                        )
                    
                    Text("DD").foregroundColor(day.isEmpty ?Color(red: 70/255, green: 70/255, blue: 73/255): Color.black)
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .frame(width: 58)
                        .overlay(
                            TextField("", text: $day)
                                .foregroundColor(.white)
                                .font(.system(size: 45,weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onReceive(Just(day), perform: {
                                    newValue in
                                    let filterd = newValue.filter{
                                        Set("0123456789").contains($0)
                                    }
                                    if filterd != newValue {
                                        self.day = filterd
                                    }
                                })
                                .onReceive(Just(day), perform: {
                                    _ in
                                    if day.count > 2 {
                                        day = String(day.prefix(2))
                                    }
                                })
                        )
                    
                    
                    Text("YYYY").foregroundColor(year.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .frame(width: 120)
                        .overlay(
                            TextField("", text: $year)
                                .foregroundColor(.white)
                                .font(.system(size: 45,weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onReceive(Just(year), perform: {
                                    newValue in
                                    let filterd = newValue.filter{
                                        Set("0123456789").contains($0)
                                    }
                                    if filterd != newValue {
                                        self.year = filterd
                                    }
                                })
                                .onReceive(Just(year), perform: {
                                    _ in
                                    if year.count > 2 {
                                        year = String(year.prefix(2))
                                    }
                                })
                        )
                    
                    
                }
                Spacer()
            }.padding(.top,50)
            
            VStack{
                Spacer()
             Text("Only to make sure you're old enough to use BeReal.")
                    .foregroundColor(Color(red: 70/255, green: 70/255, blue: 73/255))
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                
                Button(action: {
                    
                }, label: {
                    WhiteButtonView(buttonActive: $ageButtonClicked, text: "Continue")
                        .onChange(of: month, perform: {newValue in
                            if !newValue.isEmpty{
                                buttonActive = true
                            }else if newValue.isEmpty {
                                buttonActive = false
                            }
                        })
                })
            }
        }
    }
}

struct EnterAgeView_Previews: PreviewProvider {
    static var previews: some View {
        EnterAgeView()
    }
}
