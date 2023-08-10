//
//  AuthenticationViewModel.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var phoneNumber = ""
    @Published var otpText = ""
    
    @Published var navigationTag: String?
    
    func sendOTP(){
        self.navigationTag = "VERIFICATION"
    }
    
}
