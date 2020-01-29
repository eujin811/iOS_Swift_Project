//
//  CustomCell.swift
//  CollectionViewPractice
//
//  Created by YoujinMac on 2020/01/29.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    private let imageView = UIImageView()
    private var deleteFlag = false
    
    private let deleteView = UIView()
    private let checkIcon = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // deleteflag == true  -> isHidden: false
        self.clipsToBounds = true
        layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        
        // MARK: - check관련 UI Setting
        deleteView.backgroundColor = .init(red: 93, green: 93, blue: 93, alpha: 0.5)
        deleteView.isHidden = true
        contentView.addSubview(deleteView)
        
        checkIcon.image = UIImage(systemName: "checkmark.circle.fill")
        checkIcon.tintColor = .white
        checkIcon.isHidden = true
        deleteView.addSubview(checkIcon)
        
        
    }
    
    private func setupConstraint() {
        [imageView, deleteView, checkIcon].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let iconSize:CGFloat = 20
        let padding:CGFloat = 10
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            deleteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            deleteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            deleteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deleteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            checkIcon.heightAnchor.constraint(equalToConstant: iconSize),
            checkIcon.widthAnchor.constraint(equalToConstant: iconSize),
            checkIcon.bottomAnchor.constraint(equalTo: deleteView.bottomAnchor, constant: -padding),
            checkIcon.trailingAnchor.constraint(equalTo: deleteView.trailingAnchor, constant: -padding)
        ])
        
    }
    
    // MARK: - configure
    func configure(image: UIImage? /*, deleteFlag flag: Bool*/) {
        imageView.image = image
//        deleteFlag = flag
//
//        if deleteFlag == true {
//            // deleteView, checkImage isHidden false
//            deleteView.isHidden = false
//
//        } else {
//
//        }
        
    }
    
    // MARK: delete 상태의 configure
    func deleteConfigure(deleFlag flag: Bool) {
        deleteFlag = flag
        
        if deleteFlag == true {
            // deleteView, checkImage isHidden false
            deleteView.isHidden = false
            checkIcon.isHidden = false
        } else {
            deleteView.isHidden = true
            checkIcon.isHidden = true
        }
    }
    
}
