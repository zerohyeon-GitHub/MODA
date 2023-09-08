//
//  SignUpViewController.swift
//  MODA
//
//  Created by t2023-m0059 on 2023/09/05.
//

import Foundation
import UIKit
import CoreData

class SignUpViewController: UIViewController {
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "회원 가입"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: NAME Label & TextField
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름*"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    // MARK: ID Label & TextField
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID*"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    private lazy var idStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idLabel, idTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    // MARK: PASSWORD Label & TextField
    private let pwLabel: UILabel = {
        let label = UILabel()
        label.text = "PASSWORD*"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    private lazy var pwStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwLabel, pwTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    // MARK: PASSWORD CHECK Label & TextField
    private let pwCheckLabel: UILabel = {
        let label = UILabel()
        label.text = "PASSWORD CHECK*"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    private let pwCheckTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    private lazy var pwCheckStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pwCheckLabel, pwCheckTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    // MARK: E-MAIL Label & TextField
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "E-MAIL*"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.clearButtonMode = .always
        
        return textField
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var inputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView, idStackView, pwStackView, pwCheckStackView, emailStackView])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var signUpButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .black
        button.setTitle("가입", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        
        return button
    }()
    
    // 리셋버튼이 눌리면 동작하는 함수
    @objc func saveData() {
        // 데이터 저장.
        print("save Data")
        
        if nameTextField.text == "" {
            alertMessage(message: "name")
        } else if idTextField.text == "" {
            alertMessage(message: "id")
        } else if pwTextField.text == "" {
            alertMessage(message: "pw")
        } else if pwCheckTextField.text == "" {
            alertMessage(message: "pw check")
        } else {
            let data = UsersInfo(name: nameTextField.text ?? "", id: idTextField.text ?? "", pw: pwTextField.text ?? "", email: emailTextField.text ?? "")
            CoreDataManager.shared.insertCoreData(userInfo: data)
        }
    }
    
    private lazy var fetchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Fetch) Core data 전체 확인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(fetchData), for: .touchUpInside)
        
        return button
    }()
    
    @objc func fetchData() {
        print("fetch button")
        let coreData = UserInfo.fetchRequest()
        let fetch = CoreDataManager.shared.fetchCoreData(request: coreData)
        // 데이터 하나씩 출력
        for result in fetch {
            let data = UsersInfo(name: result.name ?? "", id: result.id ?? "", pw: result.pw ?? "", email: result.email ?? "")
            print("data: \(data)")
        }
    }
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("데이터 수정 가능한지 확인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
        
        return button
    }()
    
    @objc func deleteData() {
        print("delete All Button")
        let coreData = UserInfo.fetchRequest()
//        deleteAllCoreData(request: coreData)
        CoreDataManager.shared.editUserInfoCoreData(request: coreData, id: idTextField.text ?? "", name: nameTextField.text ?? "")
    }
    
    private lazy var oneDeleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("id에 있는 text를 읽어와서 core data에서 삭제", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(oneDeleteData), for: .touchUpInside)
        return button
    }()
    
    @objc func oneDeleteData() {
        print("One delete Button")
        let coreData = UserInfo.fetchRequest()
        let fetchResult = CoreDataManager.shared.fetchCoreData(request: UserInfo.fetchRequest())
        
        let count = CoreDataManager.shared.countCoreData(request: UserInfo.fetchRequest())
        print("Core 데이터 Count : \(count)")
        CoreDataManager.shared.deleteMyListCoreData(request: coreData, id: idTextField.text ?? "")
    }
    
    func alertMessage(message: String) {
        if true {
            let alert = UIAlertController(title: "회원가입", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        setupAutoLayout()
    }
    
    // MARK: - Actions
    private func configure() {
        view.backgroundColor = UIColor.white
        
        [titleLabel, inputStackView, signUpButton, fetchButton, deleteButton, oneDeleteButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupAutoLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        oneDeleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            inputStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            fetchButton.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 20),
            fetchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fetchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            deleteButton.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 10),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            oneDeleteButton.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 10),
            oneDeleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            oneDeleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            signUpButton.heightAnchor.constraint(equalToConstant: 30),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

extension UITextField {
    func underLined(viewSize: CGFloat, color: UIColor) {
        let border = CALayer()
        let width = CGFloat(1)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height + 10, width: viewSize, height: 1)
        border.borderWidth = width
        layer.addSublayer(border)
    }
}
