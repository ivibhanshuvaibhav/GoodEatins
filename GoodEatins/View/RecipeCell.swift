//
//  RecipeCell.swift
//  GoodEatins
//
//  Created by Vibhanshu Vaibhav on 09/12/18.
//  Copyright © 2018 Vibhanshu Vaibhav. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeImage.layer.cornerRadius = 10
    }
    
    func configureCell(forRecipe recipe: Recipe){
        recipeImage.image = UIImage(named: recipe.imageName)
    }
}
