//
//  LoginViewController.swift
//  MODA
//
//  Created by t2023-m0059 on 2023/09/05.
//
//조영현 MainView에서 화면을 이동할 때 사용하는 code
//private lazy var moveButton: UIButton = {
//
//    let button = UIButton()
//
//    button.backgroundColor = .black
//    button.setTitle("로그인 화면", for: .normal)
//    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//    button.addTarget(self, action: #selector(moveView), for: .touchUpInside)
//    button.translatesAutoresizingMaskIntoConstraints = false
//
//    return button
//
//}()
//
//private func setupView() {
//    view.addSubview(moveButton)
//
//    NSLayoutConstraint.activate([
//        moveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        moveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//    ])
//}
//
//// 리셋버튼이 눌리면 동작하는 함수
//@objc func moveView() {
//    let vc = LoginViewController()
//    vc.modalPresentationStyle = .fullScreen
//    self.present(vc, animated: true)
//}

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: - ID 입력창
    private lazy var idTextFieldView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.clipsToBounds = true
        
        view.addSubview(idTextField)
        view.addSubview(idLabel)
        
        return view
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.height = 48
        textField.backgroundColor = .clear
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocapitalizationType = .none // 자동 대문자 활성화 여부
        textField.autocorrectionType = .no // 자동 수정 활성화 여부
        textField.spellCheckingType = .no // 맞춤법 검사 활성화 여부
        textField.keyboardType = .emailAddress // 키보드 타입
        
        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return textField
    }()
    
    // MARK: - PASSWORD 입력창
    private lazy var pwTextFieldView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.gray
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.clipsToBounds = true
        
        view.addSubview(pwTextField)
        view.addSubview(pwLabel)
        
        return view
    }()
    
    private let pwLabel: UILabel = {
        let label = UILabel()
        label.text = "PASSWORD"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        
        return label
    }()
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size.height = 48
        textField.backgroundColor = .clear
        textField.textColor = .black
        textField.tintColor = .black // 막대 바
        textField.autocapitalizationType = .none // 자동 대문자 활성화 여부
        textField.autocorrectionType = .no // 자동 수정 활성화 여부
        textField.spellCheckingType = .no // 맞춤법 검사 활성화 여부
        textField.keyboardType = .emailAddress // 키보드 타입
        textField.isSecureTextEntry = true // 입력되는 문자가 *로 표시되는 설정
        textField.clearButtonMode = .always // 입력 내용 한번에 지우는 X버튼
        textField.clearsOnBeginEditing = false // 편집 시 기존 텍스트필드값 제거
        
        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return textField
    }()
    
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        // text가 입력이 되었는지 확인
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = " "
                return
            }
        }
        guard let id = idTextField.text, !id.isEmpty
        else {
            // 로그인 버튼 색상
            loginButton.isEnabled = false
            loginButton.backgroundColor = .gray
            return
        }
        loginButton.backgroundColor = .blue
        loginButton.isEnabled = true
    }
    
    //   MARK: - 로그인버튼
    private lazy var loginButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        button.addTarget(self, action:#selector(loginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // 로그인 버튼 누르면 동작하는 함수
    @objc private func loginButtonTapped() {
        // ID와 PW가 일치하면 로그인
        
        // Main화면으로 이동하는 기능
        print("Main 화면으로 넘어가기")
        
    }
    
    private lazy var signUpButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("회원 가입", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        return button
        
    }()
    
    // MARK: 회원 가입
    @objc func signUpButtonTapped() {
        // 회원가입 창 이동
        print("회원가입 이동")
//        //만들기
//        let alert = UIAlertController(title: "비밀번호 재설정", message: "비밀번호를 재설정?", preferredStyle: .alert)
//        let success = UIAlertAction(title: "확인", style: .default) { action in
//            print("확인버튼이 눌렸습니다.")
//        }
//        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
//            print("취소버튼이 눌렸습니다.")
//        }
//        alert.addAction(success)
//        alert.addAction(cancel)
//        // 실제 띄우기
//        self.present(alert, animated: true , completion: nil)
    }
    
    // 이메일텍스트필드, 패스워드, 로그인버튼 스택뷰에 배치
    
    private lazy var stackViewTextField: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idTextFieldView, pwTextFieldView])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var stackViewButton: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginButton, signUpButton])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    // 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 50
    private let buttonHeight: CGFloat = 30
    
    lazy var idLabelCenterYConstraint = idLabel.centerYAnchor.constraint(equalTo: idTextFieldView.centerYAnchor)
    lazy var pwLabelCenterYConstraint = pwLabel.centerYAnchor.constraint(equalTo: pwTextFieldView.centerYAnchor)
    
    // 셋팅
    private func configure() {
        view.backgroundColor = UIColor.white
        idTextField.delegate = self
        pwTextField.delegate = self
        
        [stackViewTextField, stackViewButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupAutoLayout() {
        idLabelCenterYConstraint.isActive = true
        
        idLabel.translatesAutoresizingMaskIntoConstraints =   false
        idLabel.leadingAnchor.constraint(equalTo: idTextFieldView.leadingAnchor, constant: 8).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: idTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: idTextFieldView.topAnchor, constant: 15).isActive = true
        idTextField.bottomAnchor.constraint(equalTo: idTextFieldView.bottomAnchor, constant: -2).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: idTextFieldView.leadingAnchor, constant: 8).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: idTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        pwLabelCenterYConstraint.isActive = true
        
        pwLabel.translatesAutoresizingMaskIntoConstraints =   false
        pwLabel.leadingAnchor.constraint(equalTo: pwTextFieldView.leadingAnchor, constant: 8).isActive = true
        pwLabel.trailingAnchor.constraint(equalTo: pwTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.topAnchor.constraint(equalTo: pwTextFieldView.topAnchor, constant: 15).isActive = true
        pwTextField.bottomAnchor.constraint(equalTo: pwTextFieldView.bottomAnchor, constant: -2).isActive = true
        pwTextField.leadingAnchor.constraint(equalTo: pwTextFieldView.leadingAnchor, constant: 8).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: pwTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        stackViewTextField.translatesAutoresizingMaskIntoConstraints = false
        stackViewTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackViewTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackViewTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackViewTextField.heightAnchor.constraint(equalToConstant: textViewHeight * 2 + 40).isActive = true
        
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        stackViewButton.topAnchor.constraint(equalTo: stackViewTextField.bottomAnchor, constant: 10).isActive = true
        stackViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackViewButton.heightAnchor.constraint(equalToConstant: buttonHeight * 2 + 20).isActive = true
    }
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("test")
        
        configure()
        setupAutoLayout()
    }
    
    // MARK: - Helpers
}

extension LoginViewController: UITextFieldDelegate {
    //   MARK: - 텍스트필드 편집 시작할때의 설정 - 문구가 위로올라가면서 크기 작아지고, 오토레이아웃 업데이트
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextFieldView.backgroundColor = UIColor.white
            idLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            idLabelCenterYConstraint.constant = -13
        } else if textField == pwTextField {
            pwTextFieldView.backgroundColor = UIColor.white
            pwLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            pwLabelCenterYConstraint.constant = -13
        }
        // 실제 레이아웃 변경은 애니메이션
        UIView.animate(withDuration: 0.3) {
            self.stackViewTextField.layoutIfNeeded()
        }
    }
    
    // 텍스트필드 편집 종료되면 백그라운드 색 변경 (글자가 한개도 입력 안되었을때는 되돌리기)
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextFieldView.backgroundColor = UIColor.gray
            // 빈칸이면 원래로 되돌리기
            if idTextField.text == "" {
                idLabel.font = UIFont.systemFont(ofSize: 18)
                // 오토레이아웃 업데이트
                idLabelCenterYConstraint.constant = 0
            }
        } else if textField == pwTextField {
            pwTextFieldView.backgroundColor = UIColor.gray
            // 빈칸이면 원래로 되돌리기
            if pwTextField.text == "" {
                pwLabel.font = UIFont.systemFont(ofSize: 18)
                // 오토레이아웃 업데이트
                pwLabelCenterYConstraint.constant = 0
            }
        }
        
        // 실제 레이아웃 변경은 애니메이션으로 줄꺼야
        UIView.animate(withDuration: 0.3) {
            self.stackViewTextField.layoutIfNeeded()
        }
    }
    
    // 엔터 누르면 일단 키보드 내림
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

