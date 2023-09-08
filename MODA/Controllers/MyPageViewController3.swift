//
//  MyPageViewController3.swift
//  MODA
//
//  Created by DJ S on 2023/09/04.
//

import UIKit
import CoreData

class MyPageViewController3: UIViewController {
    
    // MyPageViewController2로부터 전달된 데이터를 저장할 변수
        var userInfo: UserInfo?
    
    // 뷰 생성
    let nameLabel = UILabel()
//    let idLabel = UILabel()
    let pwLabel = UILabel()
    let emailLabel = UILabel()
    
    // 텍스트 필드를 클래스 레벨 변수로 선언
    let nameTextField = UITextField()
//    let idTextField = UITextField()
    let pwTextField = UITextField()
    let emailTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // MyPageViewController2로부터 전달된 데이터를 텍스트 필드에 표시
                if let userInfo = userInfo {
                    nameTextField.text = userInfo.name
//                    idTextField.text = userInfo.id
                    emailTextField.text = userInfo.email
                    pwTextField.text = userInfo.pw
                }
        
        // 최상단에 프로필 타이틀 추가
        let profileTitleLabel = UILabel()
        profileTitleLabel.text = "Edit"
        profileTitleLabel.font = UIFont.boldSystemFont(ofSize: 28) // 타이틀 폰트 설정
        profileTitleLabel.textAlignment = .center // 타이틀 가운데 정렬
        profileTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 각 라벨에 텍스트 설정
        nameLabel.text = "Name"
//        idLabel.text = "ID"
        pwLabel.text = "Password"
        emailLabel.text = "Email"
        
        // 각 텍스트 필드의 스타일 및 속성 설정
        nameTextField.borderStyle = .roundedRect
//        idTextField.borderStyle = .roundedRect
        pwTextField.borderStyle = .roundedRect
        emailTextField.borderStyle = .roundedRect
        
        // 각 라벨 및 텍스트 필드를 스택 뷰에 추가
        let stackView1 = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stackView1.axis = .vertical
        stackView1.spacing = 10
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        
//        let stackView2 = UIStackView(arrangedSubviews: [idLabel, idTextField])
//        stackView2.axis = .vertical
//        stackView2.spacing = 10
//        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView2 = UIStackView(arrangedSubviews: [pwLabel, pwTextField])
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
//        view.addSubview(stackView2)
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
            
            stackView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            stackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            stackView3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
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
        
        // 텍스트 필드에서 업데이트된 데이터 가져옴
            guard let updatedName = nameTextField.text,
                  let updatedEmail = emailTextField.text,
                  let updatedPw = pwTextField.text,
                  let userId = userInfo?.id else {
                          return
                      }
        
        // CoreDataManager를 사용하여 사용자 정보 업데이트
            let coreDataManager = CoreDataManager.shared
            
            if coreDataManager.editFirstUserInfoCoreData(id: userId, name: updatedName, email: updatedEmail, pw: updatedPw) {
                // Core Data를 성공적으로 업데이트한 경우
                print("사용자 데이터가 성공적으로 업데이트되었습니다.")
                dismiss(animated: true, completion: nil)
            } else {
                // Core Data 업데이트에 실패한 경우
                print("사용자 데이터 업데이트 실패.")
                // 오류 처리 또는 사용자에게 알림을 표시
            }
        // 수정 완료 후 화면을 닫음
        dismiss(animated: true, completion: nil)
    }
}




