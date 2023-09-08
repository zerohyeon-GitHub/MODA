//
//  LikelistCell.swift
//  MODA
//
//  Created by DJ S on 2023/09/07.
//

import UIKit

class LikelistCell: UITableViewCell {
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let idLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 썸네일 이미지 뷰 설정
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(thumbnailImageView)
        
        // 제목 레이블 설정
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        // ID 레이블 설정
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(idLabel)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 100),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            idLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10),
            idLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
