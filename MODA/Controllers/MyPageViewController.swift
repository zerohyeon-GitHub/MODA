//
//  MyPageViewController.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit
import CoreData

class MyPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCell", for: indexPath) as! LikelistCell
        
        let video = videos[indexPath.row]
        
        if let thumbnailURL = URL(string: video.thumbnailImageName) {
            URLSession.shared.dataTask(with: thumbnailURL) { data, _, error in
                if let error = error {
                    print("이미지 다운로드 오류: \(error.localizedDescription)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.thumbnailImageView.image = image // 'cell'의 'thumbnailImageView'에 이미지 설정
                    }
                }
            }.resume()
        }
        
        // 제목 설정
        cell.titleLabel.text = video.title
        cell.titleLabel.numberOfLines = 4 // 두 줄까지 표시되도록 설정
        cell.titleLabel.lineBreakMode = .byWordWrapping // 줄 바꿈 설정
        
        // ID 설정
        cell.idLabel.text = "ID: \(video.id)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 // 원하는 높이로 변경
    }
    
    // 테이블 뷰
    let tableView = UITableView()
    
    
    // 예제 데이터
    var videos: [Video] = [
    ]
    let apiManager = YoutubeAPIManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // API 관리자를 사용하여 인기 동영상 가져오기
        apiManager.fetchPopularVideos { [weak self] videos in
            DispatchQueue.main.async {
                self?.videos = videos
                self?.tableView.reloadData()
                
            }
        }
        
        // Register the custom cell class (커스텀 셀 클래스를 등록)
        tableView.register(LikelistCell.self, forCellReuseIdentifier: "LikeCell")
        
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
    }
    
    @objc func buttonTapped() {
        print("프로필 버튼이 눌렸습니다")
        
        // 데이터를 가져올 때 사용할 NSFetchRequest
        let fetchRequest = NSFetchRequest<UserInfo>(entityName: "UserInfo")
        
        // 가져온 데이터를 저장할 변수를 선언
        var firstItem: UserInfo?
        
        // fetchFirstIdCoreData를 호출, 첫번째 데이터를 가져옴
        if let fetchedItem = CoreDataManager.shared.fetchFirstIdCoreData(request: fetchRequest) {
            firstItem = fetchedItem
        } else {
            // 데이터를 가져오지 못한 경우
        }
        
        
        // firstItem을 사용하여 데이터를 조작하거나 표시
        if let item = firstItem {
            // MyPageViewController2에 데이터 전달
            let secondViewController = MyPageViewController2()
            secondViewController.userInfo = item // 데이터를 전달
        let secondViewController = MyPageViewController2()
        present(secondViewController, animated: true, completion: nil)
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            videos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! LikelistCell
            
            let video = videos[indexPath.row]
            
            // 썸네일 이미지 설정
            cell.thumbnailImageView.image = UIImage(named: "youtube")
            
            // 제목 설정
            cell.titleLabel.text = video.title
            
            // ID 설정
            cell.idLabel.text = "ID: \(String(video.id))"
            
            return cell
            
        }
    }
}
