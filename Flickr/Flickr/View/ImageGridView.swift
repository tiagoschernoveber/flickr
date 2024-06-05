//
//  ImageGridView.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import SwiftUI

struct ImageGridView: View {
    let images: [ImageModel]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(images) { image in
                    NavigationLink(destination: ImageDetailView(image: image)) {
                        AsyncImage(url: URL(string: image.media.m)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                ProgressView()
                            }
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
    }
}
