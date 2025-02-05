//
//  ContentView.swift
//  Sample
//
//  Created by admin on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    @State var username:String=""
    @State var password:String=""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
