//
//  MenuViewController.swift
//  FoodApp
//
//  Created by Desktop-simranjeet on 02/11/21.
//

import UIKit

struct CartItems {
    let foodItemImage:UIImage!
    let foodItemName:String!
    let foodItemsAmount:String!
    let foodItemsPrice:String!
}

var cartItemsArray = [CartItems]()

class MenuViewController: UIViewController {

    //MARK:- Variables
    var cartItemsCount = 0
    let foodItemImagesArray = [#imageLiteral(resourceName: "lemonade"),#imageLiteral(resourceName: "juice"),#imageLiteral(resourceName: "coffee")]
    let foodItemNameArray = ["Drink with lemons, dates, and honey.",
                        "Mixed fruit juice with oranges, pineapples.",
                        "Espresso coffee with variety of coffee beans."]
    let foodItemsAmountArray = ["250 L","170 L","300 L"]
    let foodItemsPriceArray = ["$6.50 ","$10.4","$5.8"]
    
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
        cart.tintColor = .lightGray
        cart.translatesAutoresizingMaskIntoConstraints = false
        return cart
    }()
    
    private var checkOutItemsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 9
        view.backgroundColor = .black
        view.layer.borderColor = UIColor(red: 255/255, green: 71/255, blue: 48/255, alpha: 1.0).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var checkOutItemsLbl: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .white
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
        label.text = "Beverages Menu"
        label.textColor = .white
        label.numberOfLines = 2
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
    
    let cartSummaryBtn: UIButton = {
       let button = UIButton()
        button.setTitle("View Cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor(red: 30/255, green: 29/255, blue: 16/255, alpha: 0.5).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 1.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(leftBackgroundView)
        view.addSubview(rightBackgroundView)
        view.addSubview(headingLbl)
        view.addSubview(cartSummaryBtn)
        leftBackgroundView.addSubview(backBtn)
        rightBackgroundView.addSubview(cartBtn)
        rightBackgroundView.addSubview(checkOutItemsView)
        rightBackgroundView.addSubview(checkOutItemsLbl)
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        self.checkOutItemsLbl.isHidden = true
        self.checkOutItemsView.isHidden = true
        table.indicatorStyle = .white
        table.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
            setUpLayout()
        backBtn.addTarget(self, action: #selector(backBtnTapped(_:)), for: .touchUpInside)
        cartSummaryBtn.addTarget(self, action: #selector(cartSummaryBtnTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cartSummaryBtn.isHidden = true
        self.view.layoutSubviews()
        UIView.animate(withDuration: 1, animations: { [self] in
            leftBackgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -70).isActive = true
            self.view.layoutSubviews()
        })
    }
    
    //MARK:- Event method for Add Item Button
    @objc private func addItemBtnTapped(_ sender: UIButton) {
       UIView.animate(withDuration: 0.5, animations: { [self] in
            if let cell = table.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? MenuTableViewCell {
              
                    cell.addItemBtn.tintColor = .white
                    cell.addItemBtn.backgroundColor = .black
                    self.checkOutItemsLbl.isHidden = false
                    self.checkOutItemsView.isHidden = false
                    self.cartBtn.tintColor = .black
                    self.cartItemsCount += 1
                    self.checkOutItemsLbl.text = "\(self.cartItemsCount)"
                    cartItemsArray.append(CartItems.init(foodItemImage: cell.foodImage.image, foodItemName: cell.foodItemName.text, foodItemsAmount: cell.foodItemsAmount.text, foodItemsPrice: cell.foodItemsPrice.text))
            }
       }) { (true) in
        UIView.animate(withDuration: 1, animations: { [self] in
            self.cartSummaryBtn.isHidden = false
            self.cartSummaryBtn.setTitleColor(.black, for: .normal)
            self.cartSummaryBtn.backgroundColor = .white
            
        })
       }
        
    }
    
    //MARK:- Event method for View Cart Button
    @objc private func cartSummaryBtnTapped(_ sender: UIButton) {
        let cartVc = self.storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        cartVc.cartItemsCount = self.cartItemsCount
        let transition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.moveIn
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(cartVc, animated: false)
    }
    
    //MARK:- Event method for back Button
    @objc private func backBtnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension MenuViewController {
    //MARK:- Method to set up constraints
    private func setUpLayout() {
        leftBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        leftBackgroundView.widthAnchor.constraint(equalToConstant: 150).isActive = true
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
        
        cartSummaryBtn.topAnchor.constraint(equalTo: table.bottomAnchor, constant: 10).isActive = true
        cartSummaryBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        cartSummaryBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cartSummaryBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        cartSummaryBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        
    }
}

//MARK:- Tableview delegates and datasource methods
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
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
        menuCell.contentView.addSubview(menuCell.addItemBtn)
        
        menuCell.foodImage.image = self.foodItemImagesArray[indexPath.row]
        menuCell.foodItemName.text = self.foodItemNameArray[indexPath.row]
        menuCell.foodItemsAmount.text = self.foodItemsAmountArray[indexPath.row]
        menuCell.foodItemsPrice.text = self.foodItemsPriceArray[indexPath.row]
        
        menuCell.addItemBtn.addTarget(self, action: #selector(addItemBtnTapped(_:)), for: .touchUpInside)
        menuCell.addItemBtn.tag = indexPath.row
        
        menuCell.selectionStyle = .none
        menuCell.backgroundColor = .clear
        return menuCell
    }
    
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
