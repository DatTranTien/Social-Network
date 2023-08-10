//
//  AuthenticationViewModel.swift
//  BeReal
//
//  Created by Admin on 10/08/2023.
//

import SwiftUI
import Firebase

class AuthenticationViewModel: ObservableObject {
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var phoneNumber = ""
    @Published var otpText = ""
    
    @Published var navigationTag: String?
    @Published var isLoading: Bool = false
    @Published var verificationCode: String = ""
    
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthenticationViewModel()
    
    func sendOTP()async {
        if isLoading {return}
        
        do {
            isLoading = true
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+84\(phoneNumber)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VERIFICATION"
            }
        }
        catch {
            handleError(error: error.localizedDescription)
        }
        
    }
    
    func handleError(error: String){
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMessage = error
            self.showAlert.toggle()
        }
    }
    func verifyOTP()async{
        do {
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            let result = try await Auth.auth().signIn(with: credential)
            
            let db = Firestore.firestore();            db.collection("users").document(result.user.uid).setData([
                "fullname": name,
                "date": year.date,
                "id": result.user.uid
            ]){
                err in
                if let err = err {
                    print(err.localizedDescription)
                }
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
                let user = result.user
                self.userSession = user
                print(user.uid)
            }
        }catch {
            print("ERROR")
            handleError(error: error.localizedDescription)
        }
    }
    
}
