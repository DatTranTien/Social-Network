//
//  LeftmenuTopView.swift
//  BeReal
//
//  Created by Admin on 09/08/2023.
//

import SwiftUI

struct LeftmenuTopView: View {
    @State var text = ""
    @State var isEditing = false
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                 Spacer()
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.white)
                }
                Text("BeReal.").foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
            }
            SearchBar(text: $text, isEditing: $isEditing)
            Spacer()
        }
    }
}

struct LeftmenuTopView_Previews: PreviewProvider {
    static var previews: some View {
        LeftmenuTopView()
    }
}
