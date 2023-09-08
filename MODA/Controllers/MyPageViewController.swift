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
    
    // 예제 데이터
    let videos: [Video] = [
        Video(id: 1, thumbnailImageName: "video100", title: "Video 111"),
        Video(id: 2, thumbnailImageName: "video200", title: "Video 222"),
        Video(id: 3, thumbnailImageName: "video300", title: "Video 333"),
        Video(id: 4, thumbnailImageName: "video400", title: "Video 444"),
        Video(id: 5, thumbnailImageName: "video500", title: "Video 555"),
        Video(id: 6, thumbnailImageName: "video600", title: "Video 666"),
        Video(id: 7, thumbnailImageName: "video700", title: "Video 777"),
        Video(id: 8, thumbnailImageName: "video800", title: "Video 888"),
        Video(id: 9, thumbnailImageName: "video900", title: "Video 999"),
        
    ]
    
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
    }
    
    @objc func buttonTapped() {
        
        print("프로필 버튼이 눌렸습니다")
        
        // 새로운 뷰 컨트롤러 생성
        let secondViewController = MyPageViewController2()
        
        // 새로운 뷰 컨트롤러를 모달로 표시
        present(secondViewController, animated: true, completion: nil)
    }
    
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
            cell.idLabel.text = "ID: \(video.id)"
            
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // 원하는 높이로 변경
    }
    
}
