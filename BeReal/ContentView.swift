//
//  ContentView.swift
//  BeReal
//
//  Created by Tran tien dat on 15/07/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        Feed()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
