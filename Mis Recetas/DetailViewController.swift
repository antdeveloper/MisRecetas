//
//  DetailViewController.swift
//  Mis Recetas
//
//  Created by Nicolas Tello on 10/12/16.
//  Copyright © 2016 Alain Nicolas Tello. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    var recipe: Recipe!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.recipe.name

        // Do any additional setup after loading the view.
        self.recipeImageView.image = self.recipe.image
        self.lblName.text = self.recipe.name
        
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.4)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.8)
        
        self.tableView.estimatedRowHeight = 60.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let image = UIImage(named: self.recipe.rating)
        self.ratingButton.setImage(image, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        if let reviewVC = segue.source as? ReviewViewController{
            if let rating = reviewVC.ratingSelected{
                self.recipe.rating = rating
                
                let image = UIImage(named: self.recipe.rating)
                self.ratingButton.setImage(image, for: .normal)
            }
        }
    }
}
