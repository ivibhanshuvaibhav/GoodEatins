//
//  ViewController.swift
//  GoodEatins
//
//  Created by Vibhanshu Vaibhav on 02/12/18.
//  Copyright © 2018 Vibhanshu Vaibhav. All rights reserved.
//

import UIKit

class CategorySelectionVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let data = DataSet()
    
    var categoryToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecipesSelectionVC {
            destination.selectedCategory = self.categoryToPass
        }
    }
    
}

extension CategorySelectionVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }
        cell.configureCell(forFoodCategory: data.categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryToPass = data.categories[indexPath.row].title
        performSegue(withIdentifier: "toRecipesSelection", sender: self)
    }
    
}
