//
//  CartTableViewCell.swift
//  FoodApp
//
//  Created by Desktop-simranjeet on 19/11/21.
//

import UIKit

class CartTableViewCell: UITableViewCell {

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
    
    let quantityStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let increaseQuantityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let decreaseQuantityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
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
        
        foodItemsPrice.topAnchor.constraint(equalTo: ratingStack.bottomAnchor,constant: 10).isActive = true
        foodItemsPrice.leadingAnchor.constraint(equalTo: foodItemsAmount.trailingAnchor,constant: 10).isActive = true
        foodItemsPrice.trailingAnchor.constraint(equalTo: quantityStack.leadingAnchor,constant: -20).isActive = true
        foodItemsPrice.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10).isActive = true
     
        quantityStack.topAnchor.constraint(equalTo: baseView.topAnchor,constant: 10).isActive = true
        quantityStack.widthAnchor.constraint(equalToConstant: 40).isActive = true
        quantityStack.trailingAnchor.constraint(equalTo: baseView.trailingAnchor,constant: 20).isActive = true
        quantityStack.bottomAnchor.constraint(equalTo: baseView.bottomAnchor,constant: -10).isActive = true
        quantityStack.addArrangedSubview(decreaseQuantityButton)
        quantityStack.addArrangedSubview(quantityLabel)
        quantityStack.addArrangedSubview(increaseQuantityButton)

    }

}

