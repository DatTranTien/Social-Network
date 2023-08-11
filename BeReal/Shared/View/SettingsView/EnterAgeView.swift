//
//  EnterAgeView.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI
import Combine

struct EnterAgeView: View {
    @Binding var year: Year
    @Binding var name: String
    @Binding var ageButtonClicked: Bool
    @State var buttonActive = false
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
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
                Text("Hi \(name), when's your birthday?")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 16))
                
                HStack{
                    Text("MM").foregroundColor(year.month.isEmpty ?Color(red: 70/255, green: 70/255, blue: 73/255): Color.black)
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .frame(width: 72)
                        .overlay(
                            TextField("", text: $year.month)
                                .foregroundColor(.white)
                                .font(.system(size: 45,weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onReceive(Just(year.month), perform: {
                                    newValue in
                                    let filterd = newValue.filter{
                                        Set("0123456789").contains($0)
                                    }
                                    if filterd != newValue {
                                        self.year.month = filterd
                                    }
                                })
                                .onReceive(Just(year.month), perform: {
                                    _ in
                                    if year.month.count > 2 {
                                        year.month = String(year.month.prefix(2))
                                    }
                                })
                            
                        )
                    
                    Text("DD").foregroundColor(year.day.isEmpty ?Color(red: 70/255, green: 70/255, blue: 73/255): Color.black)
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .frame(width: 58)
                        .overlay(
                            TextField("", text: $year.day)
                                .foregroundColor(.white)
                                .font(.system(size: 45,weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onReceive(Just(year.day), perform: {
                                    newValue in
                                    let filterd = newValue.filter{
                                        Set("0123456789").contains($0)
                                    }
                                    if filterd != newValue {
                                        self.year.day = filterd
                                    }
                                })
                                .onReceive(Just(year.day), perform: {
                                    _ in
                                    if year.day.count > 2 {
                                        year.day = String(year.day.prefix(2))
                                    }
                                })
                        )
                    
                    
                    Text("YYYY").foregroundColor(year.year.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .frame(width: 120)
                        .overlay(
                            TextField("", text: $year.year)
                                .foregroundColor(.white)
                                .font(.system(size: 45,weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onReceive(Just(year.year), perform: {
                                    newValue in
                                    let filterd = newValue.filter{
                                        Set("0123456789").contains($0)
                                    }
                                    if filterd != newValue {
                                        self.year.year = filterd
                                    }
                                })
                                .onReceive(Just(year.year), perform: {
                                    _ in
                                    if year.year.count > 4 {
                                        year.year = String(year.year.prefix(4))
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
                    if buttonActive {
                        ageButtonClicked = true
                    }
                }, label: {
                    WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                        .onChange(of: year.month, perform: {newValue in
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

//struct EnterAgeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterAgeView()
//    }
//}
