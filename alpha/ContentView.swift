//
//  ContentView.swift
//  alpha
//
//  Created by addjn on 08/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var downloadAmount = 0.0
    
    var body: some View {
        NavigationView {
        VStack {
            ProgressView("Downloading…", value: downloadAmount, total: 10)
                .progressViewStyle(LinearProgressViewStyle())
                .accentColor(.green)
                .padding()
            Button("add") {
                self.downloadAmount = self.downloadAmount + 1
            }
            NavigationLink("circular progress", destination: ContentView2())
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
