//
//  ContentView.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.search)
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    ImageGridView(images: viewModel.images)
                }
            }
            .navigationTitle("Search Area")
        }
    }
}

#Preview {
    ContentView()
}
