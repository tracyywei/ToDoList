//
//  CompleteViewController.swift
//  ToDoList
//
//  Created by Tracy Wei on 8/3/21.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var todoName: UILabel!
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoName.text = selectedToDo?.name
        
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
              context.delete(theToDo)
              navigationController?.popViewController(animated: true)
            }
          }
    }

}
