//
//  FoodsViewController.swift
//  FoodApp
//
//  Created by Desktop-simranjeet on 02/11/21.
//

import UIKit

class FoodsViewController: UIViewController {

    //MARK:- Variables
    let foodImagesArray = [#imageLiteral(resourceName: "dumpling"),#imageLiteral(resourceName: "beverages"),#imageLiteral(resourceName: "pasta"),#imageLiteral(resourceName: "pizza"),#imageLiteral(resourceName: "beef")]
    let foodNameArray = ["Dumpling","Beverages","Pasta","Beverages","Beef"]
    
    private var cartBtn: UIButton = {
        let cart       = UIButton()
        cart.setImage(UIImage(systemName: "cart"), for: .normal)
        cart.tintColor = .lightGray
        cart.translatesAutoresizingMaskIntoConstraints = false
        return cart
    }()
   
    var leftBackgroundView: UIView = {
        let view             = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var rightBackgroundView: UIView = {
        let view             = UIView()
        view.backgroundColor = UIColor(red: 238/255, green: 234/255, blue: 235/255, alpha: 1.0)
        return view
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
        rightBackgroundView.addSubview(cartBtn)
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.indicatorStyle = .white
        table.register(FoodsTableViewCell.self, forCellReuseIdentifier: "FoodsTableViewCell")
        setUpLayout()
    }
    
}

extension FoodsViewController {
    
    //MARK:- Method to set up constraints
    private func setUpLayout() {
        leftBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        leftBackgroundView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        leftBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        rightBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightBackgroundView.leadingAnchor.constraint(equalTo: leftBackgroundView.leadingAnchor, constant: 0).isActive = true
        rightBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        rightBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        table.topAnchor.constraint(equalTo: cartBtn.bottomAnchor, constant: 20).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20).isActive = true
        
        cartBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        cartBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
    }
}

//MARK:- Tableview delegates and datasource methods
extension FoodsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "FoodsTableViewCell") as! FoodsTableViewCell
        cell.contentView.addSubview(cell.baseView)
        cell.baseView.addSubview(cell.foodImage)
        cell.baseView.addSubview(cell.foodItemName)
        cell.baseView.addSubview(cell.foodItemsCount)
        cell.baseView.addSubview(cell.navigationBtn)
        
        cell.foodImage.image = self.foodImagesArray[indexPath.row]
        cell.foodItemName.text = self.foodNameArray[indexPath.row]
        cell.foodItemsCount.text = "\(indexPath.row + 2)" + " items"
    
        /* TableView cell animation */
        cell.transform = CGAffineTransform(translationX: 0, y: cell.contentView.frame.height)
                UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
                    cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
                })
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let menu = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
            let transition = CATransition()
            transition.duration = 1
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
            transition.type = CATransitionType.moveIn
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(menu, animated: false)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

