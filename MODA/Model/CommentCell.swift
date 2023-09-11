//
//  CommentCell.swift
//  MODA
//
//  Created by 김기현 on 2023/09/08.
//

import Foundation
import UIKit

class CommentCell: UITableViewCell {
    let commentTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let authorAndDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(commentTextLabel)
        addSubview(authorAndDateLabel)
        
        commentTextLabel.translatesAutoresizingMaskIntoConstraints = false
        authorAndDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            commentTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            commentTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            authorAndDateLabel.topAnchor.constraint(equalTo: commentTextLabel.bottomAnchor, constant: 8),
            authorAndDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorAndDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            authorAndDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

