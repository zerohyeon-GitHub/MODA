//
//  MyPageViewController.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit

class MyPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 테이블 뷰
    let tableView = UITableView()
    
    
    var videos: [Video] = [] // 비디오 배열
    
    var selectedVideo: Video? // 선택된 비디오 정보
    var selectedThumbnailImage: UIImage?
    
    var thumbnailImageView = UIImageView() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Register the custom cell class (커스텀 셀 클래스를 등록)
        tableView.register(LikelistCell.self, forCellReuseIdentifier: "VideoCell")
        
        // 테이블 뷰 설정
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60), // Profile 레이블 아래에 위치
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // 최상단에 Profile 라벨 추가
        let profileLabel = UILabel()
        profileLabel.text = "Likes"
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont.boldSystemFont(ofSize: 40)
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profileLabel)
        
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
        ])
        
        // 우측 상단에 버튼 추가
        let button = UIButton(type: .custom)
        let personImage = UIImage(systemName: "person.fill") // 시스템 아이콘 사용
        button.setImage(personImage, for: .normal)
        button.tintColor = .white // 아이콘 색상 설정
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalTo: button.widthAnchor) // 버튼을 정사각형 모양으로 유지
        ])
        
        // 썸네일 이미지 뷰 설정
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            thumbnailImageView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 100),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor)
        ])
        
        // 이미지 뷰에 선택된 비디오의 썸네일 이미지 설정
        if let selectedVideo = selectedVideo {
            let thumbnailImage = UIImage(named: selectedVideo.thumbnailImageName)
            thumbnailImageView.image = thumbnailImage
        }
    }
    
    @objc func buttonTapped() {
        print("프로필 버튼이 눌렸습니다")
        
        // 새로운 뷰 컨트롤러 생성
        let secondViewController = MyPageViewController2()
        present(secondViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! LikelistCell
        let video = videos[indexPath.row]
        
        cell.thumbnailImageView.image = UIImage(named: "youtube")
        cell.titleLabel.text = video.title
        cell.idLabel.text = "ID: \(String(video.id))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // 원하는 높이로 변경
    }
}
