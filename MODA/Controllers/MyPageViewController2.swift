//
//  MyPageViewController2.swift
//  MODA
//
//  Created by DJ S on 2023/09/04.
//

import UIKit
import CoreData

class MyPageViewController2: UIViewController {
    
    // MyPageViewController의 buttonTapped에서 가져온 데이터를 저장할 변수
    var userInfo: UserInfo?
    
    // userInfo를 업데이트하기 위한 클로저 프로퍼티 정의
    var updateUserInfoClosure: ((UserInfo?) -> Void)?
    // 뷰 생성
    let nameLabel = UILabel()
    let idLabel = UILabel()
    let emailLabel = UILabel()
    
    let nameTextField = UITextField()
    let idTextField = UITextField()
    let emailTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        // MyPageViewController의 buttonTapped에서 가져온 데이터를 텍스트 필드에 표시
        if let userInfo = userInfo {
            nameTextField.text = userInfo.name
            idTextField.text = userInfo.id
            emailTextField.text = userInfo.email
        }
        
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
        
        // 현재의 화면이 MyPageViewController에 속한 경우
        if let myPageViewController = presentingViewController as? MyPageViewController {
            // MyPageViewController를 닫음
            myPageViewController.dismiss(animated: true) {
                // MyPageViewController가 닫힌 후에 다음 단계 진행
                // TabBarController를 닫음
                if let tabBarController = myPageViewController.tabBarController {
                    tabBarController.dismiss(animated: true) {
                        // TabBarController가 닫힌 후에 다음 단계 진행
                        // 현재 띄워진 MyPageViewController2를 닫음
                        self.dismiss(animated: true) {
                            // MyPageViewController2가 닫힌 후에 다음 단계 진행
                            // LoginViewController를 표시
                            let loginViewController = LoginViewController()
                            loginViewController.modalPresentationStyle = .fullScreen
                            self.present(loginViewController, animated: true, completion: nil)
                        }
                    }
                }

            } else {
                logout()
                // 화면2가 아닌 경우
                // 새로운 화면1을 띄움
                let LoginViewController = LoginViewController()
                LoginViewController.modalPresentationStyle = .fullScreen
                present(LoginViewController, animated: true, completion: nil)

            }
        } else {
            // 현재의 화면이 MyPageViewController에 속하지 않는 경우
            // LoginViewController를 직접 표시
            let loginViewController = LoginViewController()
            loginViewController.modalPresentationStyle = .fullScreen
            present(loginViewController, animated: true, completion: nil)
        }
        
    }
    
    
    @objc func editButtonTapped() {
        print("EDIT 버튼이 눌렸습니다.")
        
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
            // MyPageViewController3에 데이터 전달
            let thirdViewController = MyPageViewController3()
            thirdViewController.userInfo = item // 데이터를 전달
            
            // 클로저를 사용하여 MyPageViewController2의 UI를 업데이트
            thirdViewController.updateUserInfoClosure = { [weak self] updatedUserInfo in
                DispatchQueue.main.async {
                    // 클로저에서 업데이트된 데이터를 받아서 UI를 업데이트
                    self?.nameTextField.text = updatedUserInfo?.name
                    self?.idTextField.text = updatedUserInfo?.id
                    self?.emailTextField.text = updatedUserInfo?.email
                }
            }
            
            present(thirdViewController, animated: true, completion: nil)
            
        }
    }

    
    // LoginStatus에 있는 coreData를 삭제.
    func logout(){
        let coreData = LoginStatus.fetchRequest()
        CoreDataManager.shared.deleteAllCoreData(request: coreData)
    }


}
