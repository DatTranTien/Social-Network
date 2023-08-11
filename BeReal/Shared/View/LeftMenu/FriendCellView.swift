//
//  FriendCellView.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

struct FriendCellView: View {
    var body: some View {
        HStack{
         Image("pp")
                .resizable()
                .scaledToFit()
                .frame(width: 65,height: 65)
                .cornerRadius(65/2)
            
            VStack(alignment: .leading){
                Text("Tran Dat")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text("aralaaa")
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading,6)
        }.padding(.horizontal)
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView()
    }
}
