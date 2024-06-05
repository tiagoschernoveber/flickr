//
//  ImageDetailView.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import SwiftUI

struct ImageDetailView: View {
    let image: Image

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: " ")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 300)

            Text("Title")
                .font(.headline)
                .padding()

            Text("Description")
                .padding()

            Text("Author: ")
                .padding()

            Text("Published Date:")
                .padding()

            Spacer()
        }
        .navigationTitle("Image Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
