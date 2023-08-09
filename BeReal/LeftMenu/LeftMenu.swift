//
//  LeftMenu.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

struct LeftMenu: View {
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                LeftmenuTopView()
                FriendsView()
            }
        }
    }
}

struct LeftMenu_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenu()
    }
}
