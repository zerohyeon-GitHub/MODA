////
////  DetailVC.swift
////  Pods
////
////  Created by 김기현 on 2023/09/06.
////
//
//import UIKit
//import SnapKit
//import AVKit
//
//class DetailVC: UIViewController {
//
//    let apiKey = "AIzaSyAy1spfkdGpVuB4fvJMvCSkde0YArxJnG8"
//    let searchQuery = "Music"
//
//    let videoContainerView = UIView()
//    let titleLabel = UILabel()
//    let likeButton = UIButton()
//    let commentButton = UIButton()
//
//    // AVPlayer 및 AVPlayerLayer를 클래스 수준에서 선언
//    var player: AVPlayer?
//    var playerLayer: AVPlayerLayer?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // YouTube API 엔드포인트 및 매개변수 설정
//        let baseURL = "https://www.googleapis.com/youtube/v3/search"
//        let parameters: [String: Any] = [
//            "key": apiKey,
//            "q": searchQuery,
//            "part": "snippet",
//            "maxResults": 1 // 하나의 결과만 가져올 예정
//        ]
//
//        // SnapKit을 사용하여 레이아웃 설정
//        view.addSubview(videoContainerView)
//        videoContainerView.snp.makeConstraints { make in
//            make.top.equalToSuperview() // 위쪽 제약 조건 설정
//            make.leading.trailing.equalToSuperview() // 좌우 제약 조건 설정
//            make.height.equalTo(300) // 높이 설정
//        }
//
//        view.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(videoContainerView.snp.bottom).offset(20)
//            make.leading.trailing.equalToSuperview().inset(20)
//        }
//
//        view.addSubview(likeButton)
//        likeButton.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(20)
//            make.centerX.equalToSuperview()
//        }
//
//        view.addSubview(commentButton)
//        commentButton.snp.makeConstraints { make in
//            make.top.equalTo(likeButton.snp.bottom).offset(10)
//            make.centerX.equalToSuperview()
//        }
//
//        AF.request(baseURL, method: .get, parameters: parameters)
//            .validate()
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    let json = JSON(value)
//
//                    if let items = json["items"].array, let videoId = items.first?["id"]["videoId"].string {
//                        self.playYouTubeVideo(videoId: videoId)
//                    }
//
//                case .failure(let error):
//                    print("Error: \(error)")
//                }
//            }
//    }
//
//    func playYouTubeVideo(videoId: String) {
//        // AVPlayer 및 AVPlayerLayer 생성
//        let videoURL = URL(string: "https://www.youtube.com/watch?v=\(videoId)")
//        player = AVPlayer(url: videoURL!)
//        playerLayer = AVPlayerLayer(player: player)
//        playerLayer?.videoGravity = .resizeAspectFill
//
//        // UIView를 생성하여 AVPlayerLayer를 추가
//        videoContainerView.layer.addSublayer(playerLayer!)
//
//        // 동영상 재생 시작
//        player?.play()
//    }
//}
