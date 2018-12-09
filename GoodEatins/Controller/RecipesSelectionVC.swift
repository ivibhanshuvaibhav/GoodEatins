//
//  RecipesSelectionVC.swift
//  GoodEatins
//
//  Created by Vibhanshu Vaibhav on 09/12/18.
//  Copyright © 2018 Vibhanshu Vaibhav. All rights reserved.
//

import UIKit

class RecipesSelectionVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedCategory: String!
    var recipes: [Recipe]!
    var recipeToPass: Recipe!
    let data = DataSet()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        recipes = data.getRecipes(forCategoryTitle: selectedCategory)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecipeDetailVC  {
            destination.selectedRecipe = recipeToPass
        }
    }

}

extension RecipesSelectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(forRecipe: recipes[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let cellDimension = (width / 2) - 15
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        recipeToPass = recipes[indexPath.item]
        performSegue(withIdentifier: "toRecipeSelection", sender: self)
    }
    
}
