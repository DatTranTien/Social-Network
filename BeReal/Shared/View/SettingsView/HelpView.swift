//
//  HelpView.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

@available(iOS 15.0, *)
struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ZStack{
                    Text("Help")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        })
                        Spacer()
                    }
                }.padding(.horizontal)
                Spacer()
            }
            VStack{
                VStack(spacing:16){
                    NavigationLink{
                        ContactUsView().navigationBarBackButtonHidden()
                    }label: {
                        ChevronButtonView(icon: "envelope", text: "Contact us")
                    }
                    ChevronButtonView(icon: "questionmark.circle", text: "Help Center")
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top,50)
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            HelpView()
        } else {
            // Fallback on earlier versions
        }
    }
}
