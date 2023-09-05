//
//  MyPageViewController2.swift
//  MODA
//
//  Created by DJ S on 2023/09/04.
//

import UIKit

class MyPageViewController2: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        // NotificationCenter를 등록하여 데이터 업데이트를 수신
//                NotificationCenter.default.addObserver(self, selector: #selector(updateProfileData(_:)), name: NSNotification.Name(rawValue: "UpdateProfileData"), object: nil)

        
        // 뷰 생성
        let nameLabel = UILabel()
        let idLabel = UILabel()
        let emailLabel = UILabel()
        
        let nameTextField = UITextField()
        let idTextField = UITextField()
        let emailTextField = UITextField()
        
        // 최상단에 프로필 타이틀 추가
        let profileTitleLabel = UILabel()
        profileTitleLabel.text = "Profile"
        profileTitleLabel.font = UIFont.boldSystemFont(ofSize: 28) // 타이틀 폰트 설정
        profileTitleLabel.textAlignment = .center // 타이틀 가운데 정렬
        profileTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 각 라벨에 텍스트 설정
        nameLabel.text = "Name"
        idLabel.text = "ID"
        emailLabel.text = "Email"
        
        // 각 텍스트 필드의 스타일 및 속성 설정
        nameTextField.borderStyle = .roundedRect
        idTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
        
        nameTextField.isEnabled = false
        idTextField.isEnabled = false
        emailTextField.isEnabled = false
        
        // 각 라벨 및 텍스트 필드를 스택 뷰에 추가
        let stackView1 = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stackView1.axis = .vertical
        stackView1.spacing = 10
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView2 = UIStackView(arrangedSubviews: [idLabel, idTextField])
        stackView2.axis = .vertical
        stackView2.spacing = 10
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView3 = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stackView3.axis = .vertical
        stackView3.spacing = 10
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        
        // "LOGOUT" 버튼 생성
        let logoutButton = UIButton()
        logoutButton.setTitle("LOGOUT", for: .normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        logoutButton.backgroundColor = .black
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        // "editButton" 버튼 생성
        let editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        editButton.backgroundColor = .black
        editButton.setTitleColor(.white, for: .normal)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        
        
        // 버튼을 루트 뷰에 추가
        view.addSubview(profileTitleLabel)
        
        view.addSubview(stackView1)
        view.addSubview(stackView2)
        view.addSubview(stackView3)
        
        view.addSubview(logoutButton)
        view.addSubview(editButton)
        
        // 버튼 스택 뷰의 제약 조건 설정
        NSLayoutConstraint.activate([
            
            profileTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            profileTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            stackView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            stackView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            stackView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            stackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            stackView3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            stackView3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            logoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            logoutButton.heightAnchor.constraint(equalToConstant: 100), // 버튼 높이 조정
            
            editButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -230),
            editButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    //    @objc func likesButtonTapped() {
    //        print("Likes 버튼이 눌렸습니다.")
    //    }
    
    // "LOGOUT" 버튼이 눌렸을 때 호출되는 메서드
    @objc func logoutButtonTapped() {
        print("LOGOUT 버튼이 눌렸습니다.")
    }
    @objc func editButtonTapped() {
        print("EDIT 버튼이 눌렸습니다.")
        // 새로운 뷰 컨트롤러 생성
        let thirdViewController = MyPageViewController3()
        
        // 새로운 뷰 컨트롤러를 모달로 표시
        present(thirdViewController, animated: true, completion: nil)
    }
//    
//    // NotificationCenter를 통해 데이터 업데이트를 처리
//        @objc func updateProfileData(_ notification: Notification) {
//            if let userInfo = notification.userInfo as? [String: String],
//               let updatedName = userInfo["name"],
//               let updatedId = userInfo["id"],
//               let updatedEmail = userInfo["email"] {
//                // 텍스트 필드 업데이트
//                nameTextField.text = updatedName
//                idTextField.text = updatedId
//                emailTextField.text = updatedEmail
//            }
//        }
//    deinit {
//            NotificationCenter.default.removeObserver(self)
//        }
}
