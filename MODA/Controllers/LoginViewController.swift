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
    
    // App LOGO
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        imageView.image = UIImage(named: "appLogo")
        
        return imageView
    }()
    
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
        label.font = UIFont.systemFont(ofSize: 18)
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
        label.font = UIFont.systemFont(ofSize: 18)
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
        // TextField에 입력된 text 가져오기
        let inputId: String = idTextField.text ?? ""
        let inputPw: String = pwTextField.text ?? ""
        // CoreData에서 가져온데이터를 저장할 곳
        var searchCoreData: UsersInfo = UsersInfo(name: "", id: "", pw: "", email: "")
        
        let coreData = UserInfo.fetchRequest() // CoreData
        let fetchResult = CoreDataManager.shared.fetchIdCoreData(request: coreData, id: inputId)
        for result in fetchResult {
            searchCoreData = UsersInfo(name: result.name ?? "", id: result.id ?? "", pw: result.pw ?? "", email: result.email ?? "")
        }
        
        // ID와 PW가 일치여부 확인
        if inputPw == searchCoreData.pw { // 일치한 경우
            // LogiStatus Entity에 데이터가 있는지 확인.
            let coreData = LoginStatus.fetchRequest()
            let status: LoginStatusInfo = LoginStatusInfo(status: true, id: inputId)
            
            print("count : \(CoreDataManager.shared.countCoreData(request: coreData))")
            
            if CoreDataManager.shared.countCoreData(request: coreData) == 0 { // 없는 경우 데이터 추가
                CoreDataManager.shared.statusCoreData(loginStatusInfo: status) // 데이터 추가
            } else if CoreDataManager.shared.countCoreData(request: coreData) == 1 { // 있는 경우 데이터 삭제 후 추가
                CoreDataManager.shared.deleteAllCoreData(request: coreData) // 전체 데이터 삭제
                CoreDataManager.shared.statusCoreData(loginStatusInfo: status) // 새로 데이터 추가
            } else { // 애초에 데이터가 많이 쌓인 경우 에러. (이러면 큰일남.. 왜냐하면 LoginStatus Core Data가 안지워지고 있다는 뜻)
                print("LoginStatus Core Data가 1개 이상이다.")
            }
            // 메인 화면으로 이동.
            print("Main 화면으로 넘어가기")
            
            createMainView()
        } else { // 일치하지 않은 경우
            SignUpViewController().alertMessage(title: "로그인", message: "ID와 PASSWORD를 확인해주세요.")
            print("PW가 맞지 않음.")
        }
    }
    
    func createMainView() {
        // 두 개의 뷰 컨트롤러 생성
        let mainViewController = MainViewController()
        let myPageViewController = MyPageViewController()
        
        // "메인" 탭 바 아이콘 설정
        let mainIcon = UIImage(systemName: "play.rectangle")
        mainViewController.tabBarItem = UITabBarItem(title: "메인", image: mainIcon, tag: 0)
        
        // "마이페이지" 탭 바 아이콘 설정
        let myPageIcon = UIImage(systemName: "person.crop.rectangle")
        myPageViewController.tabBarItem = UITabBarItem(title: "마이페이지", image: myPageIcon, tag: 1)
        
        // 탭 바 컨트롤러 생성
        let tabBarController = CustomTabBarController()
        tabBarController.viewControllers = [mainViewController, myPageViewController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
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
        let vc = SignUpViewController()
//        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
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
        
        [logoImageView, stackViewTextField, stackViewButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupAutoLayout() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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

