//
//  ViewController.swift
//  SQLiteSPM
//
//  Created by Salvador Lopez on 04/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    var taskList = [Task]()
    var taskDataStore: TaskDataStore!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var taskStatus: UISwitch!
    @IBOutlet weak var taskDate: UIDatePicker!
    @IBOutlet weak var taskTextField: UITextField!
    
    @IBAction func saveAction(_ sender: Any) {
        if let id = taskDataStore.insertTask(name: taskTextField.text!, date: taskDate.date){
            print("Record save it with id: \(id)")
            taskList.removeAll()
            taskList = taskDataStore.getAllTasks()
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        taskDataStore = TaskDataStore.shared
        //taskDataStore.runBatch()
        do{
            try taskDataStore.completeStatement()
        }catch{
            print("Error: \(error)")
        }
        
        taskList = taskDataStore.getAllTasks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row].name
        cell.detailTextLabel?.text = taskList[indexPath.row].date.formatted()
        return cell
    }

}

