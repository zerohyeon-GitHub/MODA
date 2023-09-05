//
//  MainView.swift
//  MODA
//
//  Created by Kyle on 2023/09/04.
//

import UIKit

class MainView: UIView {
    
    let mainButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.backgroundColor = .black
        bt.tintColor = .white
        bt.layer.cornerRadius = 8
        bt.clipsToBounds = true
        bt.setTitle("MODA", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return bt
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 4 // 가로 간격
        layout.minimumLineSpacing = 4 // 세로 간격
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
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
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            mainButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainButton.widthAnchor.constraint(equalToConstant: 100),
            mainButton.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            collectionView.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

