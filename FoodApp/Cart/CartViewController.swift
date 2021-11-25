//
//  CartViewController.swift
//  FoodApp
//
//  Created by Desktop-simranjeet on 10/11/21.
//

import UIKit

class CartViewController: UIViewController {

    //MARK:- Variables
    var cartItemsCount:Int = 0
    var itemCount:Int = 0
    
    //MARK:- Outlets
    private var backBtn: UIButton = {
        let menu = UIButton()
        menu.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        menu.tintColor = .white
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    private var cartBtn: UIButton = {
        let cart       = UIButton()
        cart.setImage(UIImage(systemName: "cart"), for: .normal)
        cart.tintColor = .white
        cart.translatesAutoresizingMaskIntoConstraints = false
        return cart
    }()
    
    private var checkOutItemsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(red: 255/255, green: 71/255, blue: 48/255, alpha: 1.0).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var checkOutItemsLbl: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.layer.borderColor = UIColor(red: 255/255, green: 71/255, blue: 48/255, alpha: 1.0).cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    var leftBackgroundView: UIView = {
        let view             = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var rightBackgroundView: UIView = {
        let view             = UIView()
        view.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var headingLbl: UILabel = {
        let label = UILabel()
        label.text = "Shopping Cart"
        label.textColor = .white
        label.font      = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let table: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .green
        return tableView
    }()
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(leftBackgroundView)
        view.addSubview(rightBackgroundView)
        view.addSubview(headingLbl)
        leftBackgroundView.addSubview(backBtn)
        rightBackgroundView.addSubview(cartBtn)
        leftBackgroundView.addSubview(checkOutItemsView)
        leftBackgroundView.addSubview(checkOutItemsLbl)
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.indicatorStyle = .white
        table.register(CartTableViewCell.self, forCellReuseIdentifier: "CartTableViewCell")
            setUpLayout()
        backBtn.addTarget(self, action: #selector(backBtnTapped(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.layoutSubviews()
        UIView.animate(withDuration: 1, animations: { [self] in
            leftBackgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
            self.view.layoutSubviews()

        },completion: {_ in
            let cartSummaryVc = self.storyboard?.instantiateViewController(identifier: "ShoppingCartSummaryViewController") as! ShoppingCartSummaryViewController
            cartSummaryVc.modalPresentationStyle = .overFullScreen
            cartSummaryVc.modalTransitionStyle = .coverVertical
            self.present(cartSummaryVc, animated: true, completion: nil)
        })
    }
    
    //MARK:- Event method for Back Button
    @objc private func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension CartViewController {
    //MARK:- Method to set up constraints
    private func setUpLayout() {
        leftBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        leftBackgroundView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        leftBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        rightBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        rightBackgroundView.trailingAnchor.constraint(equalTo: leftBackgroundView.leadingAnchor,constant: 0).isActive = true
        rightBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        
        cartBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        cartBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        
        checkOutItemsView.topAnchor.constraint(equalTo: cartBtn.topAnchor,constant: -10).isActive = true
        checkOutItemsView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        checkOutItemsView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        checkOutItemsView.trailingAnchor.constraint(equalTo: cartBtn.trailingAnchor,constant: 7).isActive = true
        
        checkOutItemsLbl.centerYAnchor.constraint(equalTo: checkOutItemsView.centerYAnchor).isActive = true
        checkOutItemsLbl.centerXAnchor.constraint(equalTo: checkOutItemsView.centerXAnchor).isActive = true
        checkOutItemsLbl.heightAnchor.constraint(equalToConstant: 10).isActive = true
        checkOutItemsLbl.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        headingLbl.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 20).isActive = true
        headingLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        
        table.topAnchor.constraint(equalTo: headingLbl.bottomAnchor, constant: 10).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        
    }
}

//MARK:- Tableview delegates and datasource methods
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        menuCell.contentView.addSubview(menuCell.baseView)
        menuCell.baseView.addSubview(menuCell.foodImage)
        menuCell.baseView.addSubview(menuCell.foodItemName)
        menuCell.baseView.addSubview(menuCell.foodItemsAmount)
        menuCell.baseView.addSubview(menuCell.ratingStack)
        menuCell.baseView.addSubview(menuCell.ratingOne)
        menuCell.baseView.addSubview(menuCell.ratingTwo)
        menuCell.baseView.addSubview(menuCell.ratingThree)
        menuCell.baseView.addSubview(menuCell.ratingFour)
        menuCell.baseView.addSubview(menuCell.ratingFive)
        menuCell.baseView.addSubview(menuCell.foodItemsPrice)
        menuCell.contentView.addSubview(menuCell.quantityStack)
        menuCell.contentView.addSubview(menuCell.quantityLabel)
        menuCell.contentView.addSubview(menuCell.increaseQuantityButton)
        menuCell.contentView.addSubview(menuCell.decreaseQuantityButton)
        
        menuCell.foodImage.image = cartItemsArray[indexPath.row].foodItemImage
        menuCell.foodItemName.text = cartItemsArray[indexPath.row].foodItemName
        menuCell.foodItemsAmount.text = cartItemsArray[indexPath.row].foodItemsAmount
        menuCell.foodItemsPrice.text = cartItemsArray[indexPath.row].foodItemsPrice
        self.checkOutItemsLbl.text = "\(cartItemsCount)"
        
        menuCell.increaseQuantityButton.addTarget(self, action: #selector(increaseQuantityButtonTapped), for: .touchUpInside)
        menuCell.increaseQuantityButton.tag = indexPath.row
        menuCell.decreaseQuantityButton.addTarget(self, action: #selector(decreaseQuantityButtonTapped), for: .touchUpInside)
        menuCell.decreaseQuantityButton.tag = indexPath.row
        
        /* TableView cell animation */
        menuCell.transform = CGAffineTransform(translationX: 0, y: menuCell.contentView.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
            menuCell.transform = CGAffineTransform(translationX: menuCell.contentView.frame.width, y: menuCell.contentView.frame.height)
        })
        
        menuCell.selectionStyle = .none
        menuCell.backgroundColor = .clear
        return menuCell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
     
    @objc private func increaseQuantityButtonTapped(_ sender: UIButton) {
        if let cell = table.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? CartTableViewCell {
            itemCount += 1
                cell.quantityLabel.text = "\(itemCount)"
            }
        
    }
    
    @objc private func decreaseQuantityButtonTapped(_ sender: UIButton) {
        if let cell = table.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? CartTableViewCell {
            itemCount -= 1
            cell.quantityLabel.text = "\(itemCount)"
        }
    }
    
}

