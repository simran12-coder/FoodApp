//
//  MenuTableViewCell.swift
//  FoodApp
//
//  Created by Desktop-simranjeet on 19/11/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    //MARK:- Variables
    let baseView: UIView = {
     let view = UIView()
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let foodImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let foodItemName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let foodItemsAmount: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let foodItemsPrice: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let ratingStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let ratingOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ratingTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ratingThree: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ratingFour: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ratingFive: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .lightGray
       button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let addItemBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
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
        baseView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        foodImage.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 25).isActive = true
        foodImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: baseView.leadingAnchor,constant: -40).isActive = true
        
        foodItemName.topAnchor.constraint(equalTo: baseView.topAnchor,constant: 10).isActive = true
        foodItemName.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor,constant: 20).isActive = true
        foodItemName.trailingAnchor.constraint(equalTo: baseView.trailingAnchor,constant: -20).isActive = true
       
        ratingStack.topAnchor.constraint(equalTo: foodItemName.bottomAnchor,constant: 10).isActive = true
        ratingStack.widthAnchor.constraint(equalToConstant: 120).isActive = true
        ratingStack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratingStack.leadingAnchor.constraint(equalTo: foodImage.trailingAnchor,constant: 20).isActive = true
  
        ratingStack.addArrangedSubview(ratingOne)
        ratingStack.addArrangedSubview(ratingTwo)
        ratingStack.addArrangedSubview(ratingThree)
        ratingStack.addArrangedSubview(ratingFour)
        ratingStack.addArrangedSubview(ratingFive)
        
        foodItemsAmount.topAnchor.constraint(equalTo: ratingStack.bottomAnchor,constant: 10).isActive = true
        foodItemsAmount.leadingAnchor.constraint(equalTo: ratingStack.leadingAnchor,constant: 0).isActive = true
        foodItemsAmount.bottomAnchor.constraint(equalTo: baseView.bottomAnchor,constant: -10).isActive = true
        
        foodItemsPrice.topAnchor.constraint(equalTo: ratingStack.bottomAnchor,constant: 10).isActive = true
        foodItemsPrice.leadingAnchor.constraint(equalTo: foodItemsAmount.trailingAnchor,constant: 10).isActive = true
        foodItemsPrice.trailingAnchor.constraint(equalTo: addItemBtn.leadingAnchor,constant: -20).isActive = true
        foodItemsPrice.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10).isActive = true
     
        addItemBtn.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        addItemBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        addItemBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addItemBtn.trailingAnchor.constraint(equalTo: baseView.trailingAnchor,constant: 20).isActive = true

    }

}
