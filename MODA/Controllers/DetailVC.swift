//
//  DetailVC.swift
//  MODA
//
//  Created by 김기현 on 2023/09/07.
//

import UIKit
import YoutubePlayer_in_WKWebView

class DetailViewController: UIViewController, WKYTPlayerViewDelegate {
    let videoPlayerView = WKYTPlayerView()
    let titleLabel = UILabel()
    let viewCountLabel = UILabel()
    var likeButton = UIButton()
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let thumbUpImage = UIImage(systemName: "hand.thumbsup.fill") {
            likeButton = UIButton(type: .custom)
            likeButton.setImage(thumbUpImage, for: .normal)
            likeButton.tintColor = .gray
            likeButton.frame = CGRect(x: 0, y: 300, width: 40, height: 40) // 버튼 프레임 설정
            likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        }
        
        videoPlayerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        videoPlayerView.delegate = self
        view.addSubview(videoPlayerView)
        
        titleLabel.frame = CGRect(x: 20, y: 220, width: view.frame.width - 40, height: 30)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        viewCountLabel.frame = CGRect(x: 20, y: 260, width: view.frame.width - 40, height: 20)
        viewCountLabel.textColor = .gray
        view.addSubview(viewCountLabel)
        view.addSubview(likeButton)
        
        
        if let video = video {
            titleLabel.text = video.title
            if let viewCount = video.viewCount {
                viewCountLabel.text = "조회수: \(viewCount)"
            } else {
                viewCountLabel.text = "조회수 정보 없음"
            }
            videoPlayerView.load(withVideoId: video.id)
        }
    }
    
    @objc func likeButtonTapped() {
        likeButton.isSelected.toggle()
        
        if likeButton.isSelected {
            likeButton.tintColor = .blue
        } else {
            likeButton.tintColor = .gray
        }
        
        if let video = video {
            let myPageViewController = MyPageViewController()
            myPageViewController.selectedVideo = video
            navigationController?.pushViewController(myPageViewController, animated: true)
        }
    }
}
