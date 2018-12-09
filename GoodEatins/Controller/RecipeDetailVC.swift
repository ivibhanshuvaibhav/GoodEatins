//
//  RecipeVC.swift
//  GoodEatins
//
//  Created by Vibhanshu Vaibhav on 09/12/18.
//  Copyright © 2018 Vibhanshu Vaibhav. All rights reserved.
//

import UIKit

class RecipeDetailVC: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeInstructions: UILabel!
    
    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImage.image = UIImage(named: selectedRecipe.imageName)
        recipeName.text = selectedRecipe.title
        recipeInstructions.text = selectedRecipe.instructions
    }
    
}
