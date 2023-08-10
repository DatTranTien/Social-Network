//
//  EnterPhoneNumber.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI

struct EnterPhoneNumber: View {
//    @State var country = Country(isoCode: "US")
    @State var showCountryList = false
    @State var buttonActive = false
    @Binding var phoneButtonClicked: Bool
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
            Spacer()
        
//
        VStack(alignment: .center,spacing: 8){
            Text("Create your account using your phone number")
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .font(.system(size: 16))

            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 1)
                    .frame(width: 75,height: 45)
                    .foregroundColor(.gray)
                    .overlay(
                        Text("+84")
                    )
//                    .onTapGesture {
//                        self.showCountryList.toggle()
//                    }
                Text("Your Phone")
                    .foregroundColor(viewModel.phoneNumber.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : .black)
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                    .frame(width: 220)
                    .overlay (
                        TextField("", text: $viewModel.phoneNumber))
                    .foregroundColor(.white)
                    .font(.system(size: 40,weight: .heavy))
            }
            Spacer()
        }.padding(.top,50)

        VStack{
            Spacer()
         Text("By tapping \"Continue\", you agree to our Privacy Policy and Term of Service. ")
                .foregroundColor(Color(red: 70/255, green: 70/255, blue: 73/255))
                .fontWeight(.semibold)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)

            Button(action: {
                Task{ await viewModel.sendOTP()}
//                viewModel.sendOTP()
                
            }, label: {
                WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                    .onChange(of: viewModel.phoneNumber, perform: {newValue in
                        if !newValue.isEmpty{
                            buttonActive = true
                        }else if newValue.isEmpty {
                            buttonActive = false
                        }
                    })
            }).disabled(viewModel.phoneNumber.isEmpty ? true : false)
        }
        }
//        .overlay{
//            Progress()
//                .opacity(viewModel.isLoading ? 1 : 0)
//        }
        
        .background(
            NavigationLink(tag: "VERIFICATION", selection:$viewModel.navigationTag){
                EnterCodeView()
                    .environmentObject(viewModel)
            } label: {
                
            }
                .labelsHidden()
        )
        .environment(\.colorScheme, .dark)
    }
}

//struct EnterPhoneNumber_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterPhoneNumber()
//    }
//}
