//
//  EnterCodeView.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI
import Combine

struct EnterCodeView: View {
    @State var otp = ""
    @State var buttonActive = false
    @State var timeRemaining=60
    let timmer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                HStack{
                    Spacer()
                    Text("BeReal")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    Spacer()
                }
                Spacer()
            }
            VStack{
                VStack{
                    VStack(alignment: .center,spacing: 8){
                        Text("Enter the code we sent to your phone number")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .font(.system(size: 16))
                        
                        Text(".....")
                            .foregroundColor(otp.isEmpty ? .gray : .black)
                            .opacity(0.8)
                            .font(.system(size: 70))
                            .padding(.top,-40)
                            .overlay(
                                TextField("", text: $otp)
                                    .foregroundColor(.white)
                                    .font(.system(size: 24,weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(otp), perform: {
                                        _ in
                                        limitText(6)
                                    })
                                    .onReceive(Just(otp), perform: {
                                        newValue in
                                        let filltered = newValue.filter({
                                            Set("0123456789").contains($0)
                                        })
                                        if filltered != newValue {
                                            otp = filltered
                                        }
                                    })
                            )
                        
                    }.padding(.top,50)
                    Spacer()
                }
                
                VStack{
                 Text("Change the phone number")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                    
                    Button(action: {
//                        sel
                    }, label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: otp.count == 6 ? "Continue" : "Resend in \(timeRemaining)s")
                    }).disabled(buttonActive ? false : true)
                        .onChange(of: otp, perform: {newValue in
                            if !newValue.isEmpty {
                                buttonActive = true
                            }else if newValue.isEmpty {
                                buttonActive = false
                            }
                        })
                }
            }
        }.onReceive(timmer, perform: { time in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else {
                buttonActive = true
            }
        })
    }
    func limitText(_ upper: Int){
        if otp.count > upper {
            otp = String(otp.prefix(upper))
        }
    }
}

struct EnterCodeView_Previews: PreviewProvider {
    static var previews: some View {
        EnterCodeView()
    }
}
