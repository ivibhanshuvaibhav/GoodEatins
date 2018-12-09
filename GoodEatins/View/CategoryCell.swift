//
//  CategoryCell.swift
//  GoodEatins
//
//  Created by Vibhanshu Vaibhav on 09/12/18.
//  Copyright © 2018 Vibhanshu Vaibhav. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.layer.cornerRadius = 10
    }

    func configureCell(forFoodCategory category: FoodCategory) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}
