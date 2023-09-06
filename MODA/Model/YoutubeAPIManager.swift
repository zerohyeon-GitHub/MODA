//
//  YoutubeAPIManager.swift
//  MODA
//
//  Created by Kyle on 2023/09/06.
//

import Foundation

struct YoutubeAPIResponse: Codable {
    struct Item: Codable {
        struct Snippet: Codable {
            struct Thumbnails: Codable {
                struct Default: Codable {
                    let url: String
                }
                
                let `default`: Default
            }
            
            let title: String
            let thumbnails: Thumbnails
        }
        
        let id: String
        let snippet: Snippet
    }
    
    let items: [Item]
}

class YoutubeAPIManager {
    let apiKey = "AIzaSyASzD9pPFFt4gxv20U2dXlwWvTVgLLzRek"
    
    func fetchPopularVideos(completion: @escaping ([Video]) -> Void) {
        // YouTube API를 위한 URL 생성
        let baseUrl = "https://www.googleapis.com/youtube/v3/videos"
        let parameters = [
            "part": "snippet",
            "chart": "mostPopular",
            "maxResults": "10",
            "regionCode": "KR",
            "key": apiKey
        ]
        
        // URLSession 요청 만들기
        if let url = createURL(baseURL: baseUrl, parameters: parameters) {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("데이터 가져오기 오류: \(error.localizedDescription)")
                    return
                }
                
                if let data = data {
                    // JSON 응답을 파싱하고 Video 배열을 생성
                    if let videos = self.parseJSON(data: data) {
                        completion(videos)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func createURL(baseURL: String, parameters: [String: String]) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
        return components?.url
    }
    
    private func parseJSON(data: Data) -> [Video]? {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(YoutubeAPIResponse.self, from: data)
            
            // API 응답에서 Video 배열을 생성
            let videos = response.items.map { item in
                let id = item.id
                let snippet = item.snippet
                let thumbnailImageName = snippet.thumbnails.default.url
                let title = snippet.title
                return Video(id: id, thumbnailImageName: thumbnailImageName, title: title)
            }
            
            return videos
        } catch {
            print("JSON 파싱 오류: \(error.localizedDescription)")
            return nil
        }
    }

}
