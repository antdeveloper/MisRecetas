//
//  SingleViewController.swift
//  Mis Recetas
//
//  Created by Nicolas Tello on 09/12/16.
//  Copyright © 2016 Alain Nicolas Tello. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.dataSource = self
        //self.tableView.delegate = self

        // Do any additional setup after loading the view.
        var recipe = Recipe(name: "Omelette supremo", image: #imageLiteral(resourceName: "omelet"), time: 20, ingredients: ["Huevos", "jamon", "Champiñones", "Queso"], steps: ["Picar, batir huevos, revolcer, tapar y voltear a fuego lento"])
        recipes.append(recipe)
        recipe = Recipe(name: "Torta de pierna", image: #imageLiteral(resourceName: "torta"), time: 10, ingredients: ["Bolillo", "Pierna", "Tomate", "Cebolla"], steps: ["Cortar las verduras", "Calentar todo en la torta"])
        recipes.append(recipe)
        recipe = Recipe(name: "Arrachera con cambray", image: #imageLiteral(resourceName: "arrachera"), time: 50, ingredients: ["Carne", "Papas cambray", "sal", "pimienta"], steps: ["Freir la carne marinada", "hervir las papas"])
        recipes.append(recipe)
        recipe = Recipe(name: "Tallarines", image: #imageLiteral(resourceName: "tallarin"), time: 30, ingredients: ["Pasta", "Aceite", "Verduras", "Salsa inglesa"], steps: ["hervir la pasta", "Freir las verduras", "Revolver y servir"])
        recipes.append(recipe)
        recipe = Recipe(name: "Consome de borrego", image: #imageLiteral(resourceName: "consome"), time: 45, ingredients: ["Caldo", "Cilantro", "Cebolla"], steps: ["Servir caldo", "Añadir verduras"])
        recipes.append(recipe)
        recipe = Recipe(name: "Camarones empanizados", image: #imageLiteral(resourceName: "camarones"), time: 60, ingredients: ["Camarones", "Pan molido"], steps: ["Hervir los camarones", "Empanizarlos", "Freirlos a fuego lento"])
        recipes.append(recipe)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

extension SingleViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }
}
