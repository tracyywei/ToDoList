//
//  ViewController.swift
//  ToDoList
//
//  Created by Tracy Wei on 8/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = ToDoTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        // we have to grab this view context to be able to work with Core Data
          if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

            // we are creating a new ToDoCD object here, naming it toDo
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)

            // if the titleTextField has text, we will call that text titleText
            if let titleText = taskTitle.text {
                // we will take the titleText and assign that value to toDo.name
                // this .name and .important came from the attributes you typed in on the Core Data page!
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }

            try? context.save()

            navigationController?.popViewController(animated: true)
          }
        
    }
    
}

