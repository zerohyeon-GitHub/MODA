//
//  MainModel.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//


struct Video {
    let id: String
    let thumbnailImageName: String
    let title: String
    let videoURL: String
    let viewCount: Int 
    
    init(id: String, thumbnailImageName: String, title: String, videoURL: String, viewCount: Int) {
        self.id = id
        self.thumbnailImageName = thumbnailImageName
        self.title = title
        self.videoURL = videoURL
        self.viewCount = viewCount
    }
}
