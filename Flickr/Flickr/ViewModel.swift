//
//  ViewModel.swift
//  Flickr
//
//  Created by Tiago Schernoveber on 05/06/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var search: String = ""
    @Published var images: [ImageModel] = []
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="

    init() {
        $search
            .removeDuplicates()
            .sink { [weak self] searchTerm in
                self?.fetchImages(for: searchTerm)
            }
            .store(in: &cancellables)
    }

    func fetchImages(for searchTerm: String) {
        guard !searchTerm.isEmpty else {
            self.images = []
            return
        }

        self.isLoading = true

        let urlString = baseURL + searchTerm
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }

                let jsonString = String(data: data, encoding: .utf8)?
                    .replacingOccurrences(of: "\\/", with: "/")
                
                guard let cleanedData = jsonString?.data(using: .utf8) else {
                    throw URLError(.badServerResponse)
                }
                return cleanedData
            }
            .decode(type: ResponseModel.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
                self.isLoading = false
            }, receiveValue: { response in
                self.images = response.items
            })
            .store(in: &cancellables)
    }
}
