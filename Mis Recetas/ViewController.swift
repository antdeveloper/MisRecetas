//
//  ViewController.swift
//  Mis Recetas
//
//  Created by Nicolas Tello on 09/12/16.
//  Copyright © 2016 Alain Nicolas Tello. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                
        // Do any additional setup after loading the view, typically from a nib.
        var recipe = Recipe(name: "Omelette supremo", image: #imageLiteral(resourceName: "omelet"), time: 20, ingredients: ["Huevos", "Champiñones", "Queso"], steps: ["Picar, batir huevos, revolcer, tapar y voltear a fuego lento"])
        recipes.append(recipe)
        recipe = Recipe(name: "Torta de pierna", image: #imageLiteral(resourceName: "torta"), time: 10, ingredients: ["Bolillo", "Pierna", "Tomate", "Cebolla"], steps: ["Cortar las verduras", "Calentar todo en la torta"])
        recipes.append(recipe)
        recipe = Recipe(name: "Arrachera con cambray", image: #imageLiteral(resourceName: "arrachera"), time: 50, ingredients: ["Carne", "Papas cambray", "sal", "pimienta", "aceite", "agua"], steps: ["Freir la carne marinada", "hervir las papas"])
        recipes.append(recipe)
        recipe = Recipe(name: "Tallarines", image: #imageLiteral(resourceName: "tallarin"), time: 30, ingredients: ["Pasta", "Aceite", "Verduras", "Salsa inglesa"], steps: ["hervir la pasta", "Freir las verduras", "Revolver durante un minuto y servir"])
        recipes.append(recipe)
        recipe = Recipe(name: "Consome de borrego", image: #imageLiteral(resourceName: "consome"), time: 45, ingredients: ["Caldo", "Cilantro", "Cebolla"], steps: ["Servir caldo", "Añadir verduras"])
        recipes.append(recipe)
        recipe = Recipe(name: "Camarones empanizados", image: #imageLiteral(resourceName: "camarones"), time: 60, ingredients: ["Camarones", "Pan molido"], steps: ["Hervir los camarones", "Empanizarlos con pan molido extra crujiente, untar un poco de huevo antes para un mejor agarre", "Freirlos a fuego lento"])
        recipes.append(recipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    //MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        /*cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image*/
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        /*if recipe.isFavorite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        /*cell.thumbnailImageView.layer.cornerRadius = 44.0
        cell.thumbnailImageView.clipsToBounds = true*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        //self.tableView.reloadData()
        self.tableView.deleteRows(at: [indexPath], with: .top)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Share"){(action, indexPath) in
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App del curso de iOS 10"
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        //Delete
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete"){(action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }
    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favoriteActionTitle = "Favorito"
        var favoriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavorite {
            favoriteActionTitle = "No favorito"
            favoriteActionStyle = UIAlertActionStyle.destructive
        }
        let favouriteAction = UIAlertAction(title: favoriteActionTitle, style: favoriteActionStyle){(action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        self.present(alertController, animated: true, completion: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let IndexPath = self.tableView.indexPathForSelectedRow{
                let selectedRecipe = self.recipes[IndexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
}

