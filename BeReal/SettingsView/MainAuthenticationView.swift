//
//  MainAuthenticationView.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI

struct MainAuthenticationView: View {
    @State private var nameButtonClicked = false
    @State private var ageButtonClicked = false
    @State private var phoneButtonClicked = false
    
    @StateObject var viewModel = AuthenticationViewModel()
    var body: some View {
        NavigationView{
            if !nameButtonClicked {
                EnterName(nameButtonClicked: $nameButtonClicked)
                    .environmentObject(viewModel)
            }
            else if nameButtonClicked && !ageButtonClicked {
                EnterAgeView(ageButtonClicked: $ageButtonClicked)
                    .environmentObject(viewModel)
            }
            else if nameButtonClicked && !ageButtonClicked && !phoneButtonClicked {
//                EnterPhoneNumber(phoneButtonClicked: $phoneButtonClicked)
//                .environmentObject(viewModel)
            }
        }
    }
}

struct MainAuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        MainAuthenticationView()
    }
}
