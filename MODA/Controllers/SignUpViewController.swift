//
//  SignUpViewController.swift
//  MODA
//
//  Created by t2023-m0059 on 2023/09/05.
//

import Foundation
import UIKit

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
        stackView.spacing = 30
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
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
        
        [titleLabel, inputStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupAutoLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            inputStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}
