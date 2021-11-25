//
//  FoodsTableViewCell.swift
//  FoodApp
//
//  Created by Desktop-simranjeet on 02/11/21.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {
    
    let baseView: UIView = {
     let view = UIView()
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let foodImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let foodItemName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 25, weight: UIFont.Weight(rawValue: 3))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let foodItemsCount: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let navigationBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = false
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1.0
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        baseView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        baseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 40).isActive = true
        baseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20).isActive = true
        baseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10).isActive = true
        
        foodImage.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: baseView.leadingAnchor,constant: -40).isActive = true
        
        foodItemName.centerYAnchor.constraint(equalTo: navigationBtn.topAnchor,constant: 10).isActive = true
        foodItemName.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor,constant: 20).isActive = true
        
        foodItemsCount.topAnchor.constraint(equalTo: foodItemName.bottomAnchor,constant: 5).isActive = true
        foodItemsCount.leadingAnchor.constraint(equalTo: foodItemName.leadingAnchor,constant: 0).isActive = true
     
        navigationBtn.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        navigationBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        navigationBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        navigationBtn.trailingAnchor.constraint(equalTo: baseView.trailingAnchor,constant: 10).isActive = true

    }
}
