//
//  ImageDetailView.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import SwiftUI

struct ImageDetailView: View {
    let image: ImageModel

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.media.m)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 300)

            Text(image.title)
                .font(.headline)
                .padding()

            Text(image.description)
                .padding()

            Text("Author: \(image.author)")
                .padding()

            Text("Published Date: \(image.published)")
                .padding()

            Spacer()
        }
        .navigationTitle("Image Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
