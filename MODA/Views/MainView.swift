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
        let imageView = UIImageView(image: UIImage(named: "120"))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            
            bt.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: bt.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: bt.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: bt.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: bt.trailingAnchor)
            ])
        return bt
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
        return collectionView
    }()
    
    let searchButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        bt.tintColor = .black
        return bt
    }()
    
    let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "검색..."
        return textField
    }()
    
    let clearSearchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.isHidden = true
        return button
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
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchButton)
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchView.addSubview(searchTextField)
        addSubview(searchView)
        
        clearSearchButton.translatesAutoresizingMaskIntoConstraints = false
        searchView.addSubview(clearSearchButton)
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
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            searchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            
            searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -16),
            searchTextField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            
            clearSearchButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -4),
            clearSearchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            clearSearchButton.widthAnchor.constraint(equalToConstant: 20),
            clearSearchButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

