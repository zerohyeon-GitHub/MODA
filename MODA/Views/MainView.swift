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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8 // 가로 간격
        layout.minimumLineSpacing = 8 // 세로 간격
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    
    func setUI() {
        backgroundColor = .white
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainButton)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "VideoCell")
        addSubview(collectionView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            mainButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            mainButton.widthAnchor.constraint(equalToConstant: 100),
            mainButton.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

