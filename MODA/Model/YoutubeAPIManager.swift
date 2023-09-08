//
//  YoutubeAPIManager.swift
//  MODA
//
//  Created by Kyle on 2023/09/06.
//

import Foundation

struct YoutubeAPIResponse: Codable {
    let items: [Item]
    let nextPageToken: String?
    
    struct Item: Codable {
        let id: String
        let snippet: Snippet
        let statistics: Statistics?
        
        struct Snippet: Codable {
            let title: String
            let thumbnails: Thumbnails
            
            struct Thumbnails: Codable {
                struct Default: Codable {
                    let url: String
                }
                
                let `default`: Default
            }
        }
        
        struct Statistics: Codable {
            let viewCount: String?
        }
    }
}


class YoutubeAPIManager {
    let apiKey = "AIzaSyASzD9pPFFt4gxv20U2dXlwWvTVgLLzRek"
    var nextPageToken: String?
    
    func fetchPopularVideos(completion: @escaping ([Video]) -> Void) {
        var urlComponents = URLComponents(string: "https://www.googleapis.com/youtube/v3/videos")!
        
        var queryItems = [
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "chart", value: "mostPopular"),
            URLQueryItem(name: "maxResults", value: "20"),
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "regionCode", value: "KR")
            
        ]
        
        if let nextPageToken = self.nextPageToken {
            queryItems.append(URLQueryItem(name: "pageToken", value: nextPageToken))
        }
        
        urlComponents.queryItems = queryItems
        
        let request = URLRequest(url: urlComponents.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(YoutubeAPIResponse.self, from: data)
                self.nextPageToken = response.nextPageToken
                completion(response.items.map { Video(id: $0.id, thumbnailImageName: $0.snippet.thumbnails.default.url, title: $0.snippet.title, viewCount: $0.statistics?.viewCount) })
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

