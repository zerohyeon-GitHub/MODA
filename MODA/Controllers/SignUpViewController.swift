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
        // 현재 시간
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDate = formatter.string(from: Date())
        
        if nameTextField.text == "" {
            alertMessage(message: "name")
        } else if idTextField.text == "" {
            alertMessage(message: "id")
        } else if pwTextField.text == "" {
            alertMessage(message: "pw")
        } else if pwCheckTextField.text == "" {
            alertMessage(message: "pw check")
        } else {
            // 데이터 저장.
            // NSManagedObjectContext를 가져온다.
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            // Entity를 가져온다.
            let entity = NSEntityDescription.entity(forEntityName: "UserInfo", in: context)
            // NSManagedObjet를 만든다.
            // NSManagedObject에 값을 세팅해준다.
            let data = UsersInfo(name: nameTextField.text ?? "", id: idTextField.text ?? "", pw: pwTextField.text ?? "", email: emailTextField.text ?? "")
            
            if let entity = entity {
                let usersInfo = NSManagedObject(entity: entity, insertInto: context)
                usersInfo.setValue(data.name, forKey: "name")
                usersInfo.setValue(data.id, forKey: "id")
                usersInfo.setValue(data.pw, forKey: "pw")
                usersInfo.setValue(data.email, forKey: "email")
                
                // NSManagedObjectContext 저장.
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        fetchContact()
    }
    
    private lazy var testButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .black
        button.setTitle("test", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(testData), for: .touchUpInside)
        
        return button
    }()
    
    @objc func testData() {
        fetchContact()
    }
    
    func fetchContact() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let contact = try context.fetch(UserInfo.fetchRequest()) as! [UserInfo]
            contact.forEach {
                print("$0 : \($0)")
                print("$0.name : \($0.name)")
                print("$0.id : \($0.id)")
                print("$0.pw : \($0.pw)")
                print("$0.email : \($0.email)")
            }
        } catch {
            print(error.localizedDescription)
        }
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
        
        [titleLabel, inputStackView, signUpButton, testButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupAutoLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            inputStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            testButton.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 20),
            testButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            testButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
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
