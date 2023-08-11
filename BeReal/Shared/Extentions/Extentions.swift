//
//  Extentions.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

extension View{
    func placeholder<Content:View>(
        when shouldShow:Bool,
    alighment: Alignment = .leading,
        @ViewBuilder placeholder: ()->Content) -> some View{
            ZStack(alignment: alighment){
                placeholder().opacity(shouldShow ? 1 :0) .self
            }
        }
    
    
}

extension UIApplication{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
