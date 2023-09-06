//
//  VideoManager.swift
//  MODA
//
//  Created by 김기현 on 2023/09/06.
//

// VideoDataManager.swift

import Foundation
import Alamofire
import SwiftyJSON

class VideoDataManager {
    
    static let shared = VideoDataManager()
    
    private init() {}
    
    func fetchYouTubeVideos(completion: @escaping ([Video]) -> Void) {
        let apiKey = "AIzaSyAy1spfkdGpVuB4fvJMvCSkde0YArxJnG8"
        let baseURL = "https://www.googleapis.com/youtube/v3/search"
        let searchQuery = "헬스" //
        
        let parameters: [String: Any] = [
            "key": apiKey,
            "q": searchQuery,
            "part": "snippet",
            "maxResults": 10
        ]
        
        AF.request(baseURL, method: .get, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    var videos: [Video] = []
                    
                    if let items = json["items"].array {
                        for item in items {
                            if let videoId = item["id"]["videoId"].string,
                               let title = item["snippet"]["title"].string,
                               let thumbnailURL = item["snippet"]["thumbnails"]["medium"]["url"].string {
                                let videoURL = "https://www.youtube.com/watch?v=\(videoId)"
                                let video = Video(id: videoId, thumbnailImageName: thumbnailURL, title: title, videoURL: videoURL)
                                videos.append(video)
                            }
                        }
                    }
                    
                    completion(videos)
                    
                case .failure(let error):
                    print("Error: \(error)")
                    completion([])
                }
            }
    }
}





