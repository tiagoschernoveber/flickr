//
//  ImageModel.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import Foundation

import Foundation



struct ImageModel: Codable, Identifiable, Hashable {
    var id: UUID {
        return UUID()
    }
    let title: String
    let link: String
    let media: Media
    let dateTaken: String?
    let description: String
    let published: String
    let author: String
    let authorId: String?
    let tags: String

    enum CodingKeys: String, CodingKey {
        case title, link, media, description, published, author, tags
        case dateTaken = "date_taken"
        case authorId = "author_id"
    }

    struct Media: Codable {
        let m: String
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool {
        lhs.link == rhs.link
    }
}

