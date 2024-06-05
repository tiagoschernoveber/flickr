//
//  ImageModel.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import Foundation

struct ImageModel: Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    let title: String
    let link: String
    let media: Media
    let author: String
    let date: String
    let description: String
    let publishedDate: String

    struct Media: Codable {
        let m: String
    }
}
