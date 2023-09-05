//
//  MyPageViewController.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit

class MyPageViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
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
    
    // 델리게이트에서 네비게이션 안썼을 때
    @objc func buttonTapped() {
        // 새로운 뷰 컨트롤러 생성
        let secondViewController = MyPageViewController2()
        
        // 새로운 뷰 컨트롤러를 모달로 표시
        present(secondViewController, animated: true, completion: nil)
    }
    

}
