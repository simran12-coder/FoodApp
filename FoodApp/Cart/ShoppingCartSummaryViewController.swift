//
//  ShoppingCartSummaryViewController.swift
//  FoodApp
//
//  Created by Desktop-simranjeet on 20/11/21.
//

import UIKit

class ShoppingCartSummaryViewController: UIViewController {

    //MARK:- Variables
    let baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 1.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headingLbl: UILabel = {
        let label = UILabel()
        label.text = "Shopping Cart Summary"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dropDownButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let numberOfItemsLbl: UILabel = {
        let label = UILabel()
        label.text = "Number Of Items:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemsCountLbl: UILabel = {
        let label = UILabel()
        label.text = "\(cartItemsArray.count)"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTotalLbl: UILabel = {
        let label = UILabel()
        label.text = "Subtotal:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTotalAmtLbl: UILabel = {
        let label = UILabel()
        label.text = "$25.75"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taxLbl: UILabel = {
        let label = UILabel()
        label.text = "Tax:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taxAmtLbl: UILabel = {
        let label = UILabel()
        label.text = "$1.00"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalLbl: UILabel = {
        let label = UILabel()
        label.text = "Total:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalAmtLbl: UILabel = {
        let label = UILabel()
        label.text = "$26.75"
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .lightGray
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let checkOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Checkout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor(red: 30/255, green: 29/255, blue: 16/255, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(baseView)
        baseView.addSubview(headingLbl)
        baseView.addSubview(dropDownButton)
        dropDownButton.addTarget(self, action: #selector(dropDownButtonTapped), for: .touchUpInside)
        checkOutButton.addTarget(self, action: #selector(checkoutBtnTapped), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        baseView.addSubview(numberOfItemsLbl)
        baseView.addSubview(itemsCountLbl)
        baseView.addSubview(subTotalLbl)
        baseView.addSubview(subTotalAmtLbl)
        baseView.addSubview(taxLbl)
        baseView.addSubview(taxAmtLbl)
        baseView.addSubview(totalLbl)
        baseView.addSubview(totalAmtLbl)
        baseView.addSubview(deleteButton)
        baseView.addSubview(bookmarkButton)
        baseView.addSubview(checkOutButton)
        setUpLayout()
       
    }
    
    @objc private func deleteButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        cartItemsArray.removeAll()
    }
    
    @objc private func checkoutBtnTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.dropDownButton.transform = self.dropDownButton.transform.rotated(by: .pi)
        })
        self.baseView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.headingLbl.topAnchor.constraint(equalTo: self.baseView.topAnchor, constant: 15).isActive = true
        self.headingLbl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0).isActive = true
        self.deleteButton.isHidden = true
        self.bookmarkButton.isHidden = true
        self.checkOutButton.isHidden = true
        self.itemsCountLbl.isHidden = true
        self.subTotalAmtLbl.isHidden = true
        self.taxAmtLbl.isHidden = true
        self.totalAmtLbl.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                      with event: UIEvent?) {
            self.dismiss(animated: false, completion: nil)
        
    }
    
    @objc private func dropDownButtonTapped(_ sender: UIButton) {
       
    }
    
    //MARK:- Method to set up constraints
    func setUpLayout() {
        baseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        headingLbl.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 30).isActive = true
        headingLbl.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20).isActive = true
        headingLbl.trailingAnchor.constraint(equalTo: dropDownButton.leadingAnchor, constant: 10).isActive = true
        
        dropDownButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20).isActive = true
        dropDownButton.centerYAnchor.constraint(equalTo: headingLbl.centerYAnchor, constant: 0).isActive = true
        dropDownButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dropDownButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        numberOfItemsLbl.topAnchor.constraint(equalTo: headingLbl.bottomAnchor, constant: 50).isActive = true
        numberOfItemsLbl.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20).isActive = true
        
        itemsCountLbl.centerYAnchor.constraint(equalTo: numberOfItemsLbl.centerYAnchor, constant: 0).isActive = true
        itemsCountLbl.leadingAnchor.constraint(equalTo: numberOfItemsLbl.trailingAnchor, constant: 20).isActive = true
        itemsCountLbl.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -40).isActive = true
        
        subTotalLbl.topAnchor.constraint(equalTo: numberOfItemsLbl.bottomAnchor, constant: 20).isActive = true
        subTotalLbl.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20).isActive = true
        
        subTotalAmtLbl.centerYAnchor.constraint(equalTo: subTotalLbl.centerYAnchor, constant: 0).isActive = true
        subTotalAmtLbl.leadingAnchor.constraint(equalTo: subTotalLbl.trailingAnchor, constant: 20).isActive = true
        subTotalAmtLbl.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -40).isActive = true
        
        taxLbl.topAnchor.constraint(equalTo: subTotalLbl.bottomAnchor, constant: 20).isActive = true
        taxLbl.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20).isActive = true
        
        taxAmtLbl.centerYAnchor.constraint(equalTo: taxLbl.centerYAnchor, constant: 0).isActive = true
        taxAmtLbl.leadingAnchor.constraint(equalTo: taxLbl.trailingAnchor, constant: 20).isActive = true
        taxAmtLbl.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -40).isActive = true
        
        totalLbl.topAnchor.constraint(equalTo: taxLbl.bottomAnchor, constant: 20).isActive = true
        totalLbl.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20).isActive = true
        
        totalAmtLbl.centerYAnchor.constraint(equalTo: totalLbl.centerYAnchor, constant: 0).isActive = true
        totalAmtLbl.leadingAnchor.constraint(equalTo: totalLbl.trailingAnchor, constant: 20).isActive = true
        totalAmtLbl.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -40).isActive = true
        
        deleteButton.topAnchor.constraint(equalTo: totalLbl.bottomAnchor, constant: 30).isActive = true
        deleteButton.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        bookmarkButton.topAnchor.constraint(equalTo: totalLbl.bottomAnchor, constant: 30).isActive = true
        bookmarkButton.leadingAnchor.constraint(equalTo: deleteButton.trailingAnchor, constant: 20).isActive = true
        bookmarkButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkOutButton.topAnchor.constraint(equalTo: totalAmtLbl.bottomAnchor, constant: 30).isActive = true
        checkOutButton.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20).isActive = true
        checkOutButton.centerYAnchor.constraint(equalTo: deleteButton.centerYAnchor, constant: 0).isActive = true
        checkOutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkOutButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
