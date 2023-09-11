//
//  RelatedVideoCell.swift
//  MODA
//
//  Created by 김기현 on 2023/09/11.
//

import UIKit

class RelatedVideoCell: UICollectionViewCell {
    let thumbnailImageView: UIImageView
    let titleLabel: UILabel

    override init(frame: CGRect) {
        thumbnailImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.8))
        titleLabel = UILabel(frame: CGRect(x: 0, y: frame.height * 0.8, width: frame.width, height: frame.height * 0.2))

        super.init(frame: frame)

        // 나머지 코드를 여기에 추가
        thumbnailImageView.contentMode = .scaleAspectFill
        contentView.addSubview(thumbnailImageView)

        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        contentView.addSubview(titleLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


