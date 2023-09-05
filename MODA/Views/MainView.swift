//
//  MainView.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit

class MainView: UIView {
    
    let mainButton: UIButton = {
        $0.backgroundColor = .black
        $0.tintColor = .white
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.setTitle("MODA", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return $0
    }(UIButton(type: .custom))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    func setUI() {
        backgroundColor = .white
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            mainButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            mainButton.widthAnchor.constraint(equalToConstant: 100),
            mainButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

