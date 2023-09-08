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
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            logoutButton.heightAnchor.constraint(equalToConstant: 100),
            
            editButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -220),
            editButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    // "LOGOUT" 버튼이 눌렸을 때 호출되는 메서드
    @objc func logoutButtonTapped() {
        print("LOGOUT 버튼이 눌렸습니다.")
        
        // 화면1: LoginViewController
        // 화면2: MyPageViewController
        // 화면3: MyPageViewController2
        // 화면2, 화면3 메모리 해제
        if let MyPageViewController = presentingViewController as? MyPageViewController {
                // 화면2를 닫음
            MyPageViewController.dismiss(animated: true) {
                // 그 후에 화면3도 닫음
                    self.dismiss(animated: true, completion: nil)
                }
            } else {
                // 화면2가 아닌 경우
                // 새로운 화면1을 띄움
                let LoginViewController = LoginViewController()
                LoginViewController.modalPresentationStyle = .fullScreen
                present(LoginViewController, animated: true, completion: nil)
            }
    }
    
    @objc func editButtonTapped() {
        print("EDIT 버튼이 눌렸습니다.")
        // 새로운 뷰 컨트롤러 생성
        let thirdViewController = MyPageViewController3()
        
        // 새로운 뷰 컨트롤러를 모달로 표시
        present(thirdViewController, animated: true, completion: nil)
    }

}
