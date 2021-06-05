//
//  ImageFetcher.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Foundation

protocol ImageFetcherProtocol {
    func fetchImages(at urls: [URL], keepOrder: Bool, completion: @escaping ([Result<Data, RequestError>]) -> Void)
    func fetchImage(at url: URL, completion: @escaping (Result<Data, RequestError>) -> Void)
}

final class ImageFetcher: ImageFetcherProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchImages(at urls: [URL], keepOrder: Bool = false, completion: @escaping ([Result<Data, RequestError>]) -> Void) {
        let group = DispatchGroup()
        var results = [Result<Data, RequestError>]()
        var urlsDownloadedOrder = [URL]()

        urls.forEach { url in
            group.enter()
            fetchImage(at: url) { result in
                if keepOrder {
                    urlsDownloadedOrder.append(url)
                }
                results.append(result)
                group.leave()
            }
        }

        group.notify(queue: .main) {
            guard keepOrder else {
                completion(results)
                return
            }

            var orderedResults = [Result<Data, RequestError>]()
            urls.forEach { url in
                if let index = urlsDownloadedOrder.firstIndex(of: url) {
                    orderedResults.append(results[index])
                }
            }
            completion(orderedResults)
        }
    }

    func fetchImage(at url: URL, completion: @escaping (Result<Data, RequestError>) -> Void) {
        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.underlying(error)))
                }
                return
            }

            if let response = response as? HTTPURLResponse, !response.isSuccessResponse {
                DispatchQueue.main.async {
                    completion(.failure(.requestFailed(response.statusCode)))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.emptyResponse))
                }
                return
            }

            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        .resume()
    }
}
