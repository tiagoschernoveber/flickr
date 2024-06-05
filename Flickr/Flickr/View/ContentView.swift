//
//  ContentView.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: .constant(" "))

                //ImageGridView(images: " ")
                
            }
            .navigationTitle("Search Area")
        }
    }
}

#Preview {
    ContentView()
}
