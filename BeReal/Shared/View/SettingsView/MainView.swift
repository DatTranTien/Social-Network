//
//  MainView.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                MainAuthenticationView()
            }
            else {
                if viewModel.currentUser != nil {
                    ContentView()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
