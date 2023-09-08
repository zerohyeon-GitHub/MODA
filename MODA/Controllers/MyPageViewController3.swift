//
//  MyPageViewController3.swift
//  MODA
//
//  Created by DJ S on 2023/09/04.
//

import UIKit

class MyPageViewController3: UIViewController {
    
    // 뷰 생성
    let nameLabel = UILabel()
    let idLabel = UILabel()
    let emailLabel = UILabel()
    
    // 텍스트 필드를 클래스 레벨 변수로 선언
        let nameTextField = UITextField()
        let idTextField = UITextField()
        let emailTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        let profileTitleLabel = UILabel()
        profileTitleLabel.text = "Edit"
        profileTitleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        profileTitleLabel.textAlignment = .center
        profileTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "Name"
        idLabel.text = "ID"
        emailLabel.text = "Email"
        
        nameTextField.borderStyle = .roundedRect
        idTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
        
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
        
        
        // "editButton" 버튼 생성
        let saveButton = UIButton()
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        saveButton.backgroundColor = .black
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        
        // 버튼을 루트 뷰에 추가
        view.addSubview(profileTitleLabel)
        
        view.addSubview(stackView1)
        view.addSubview(stackView2)
        view.addSubview(stackView3)
        
        view.addSubview(saveButton)
        
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
            
            
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -230),
            saveButton.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func saveButtonTapped() {
        print("SAVE 버튼이 눌렸습니다.")
        dismiss(animated: true, completion: nil)
    }
}



