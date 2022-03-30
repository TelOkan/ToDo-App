//
//  ViewController.swift
//  ToDo_Odev
//
//  Created by Okan on 17.03.2022.
//

import UIKit

class MainVc: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    var mainVcPresenterObject : ViewToPresenterMainVcProtocol?
    var toDoTaskList = [ToDoTask]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.separatorStyle = .none
        getDatabaseCopy()
        MainVcRouter.createModule(ref: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        mainVcPresenterObject?.getAllTask()
    }
    
    
    func getDatabaseCopy(){
        let bundlePath = Bundle.main.path(forResource: "toDoTask", ofType: ".sqlite") //bundle yolunu belirttik yani database'imizi tanıttık.
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("toDoTask.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: copyPath.path){
            print("Database already have exist. Do not need to copy.")
        }else {
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            }catch {
                
            }
        }
    }
    
}

extension MainVc : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mainVcPresenterObject?.searchTask(searchText: searchText)
    }
}

extension MainVc : PresenterToViewMainVcProtocol {
    func sendListToView(tasksList: Array<ToDoTask>) {
        self.toDoTaskList = tasksList
        
        self.tableView.reloadData()
    }
    
    
}

extension MainVc : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTaskList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tasks = toDoTaskList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.headerLabel.text = tasks.task_header
        cell.view.layer.cornerRadius = cell.view.frame.height / 6
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(contextualAction,view,bool) in
            let task = self.toDoTaskList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Operation", message: "Delete The '\(task.task_header!)' recod ?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in}
            alert.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
                self.mainVcPresenterObject?.deleteSelected(taskId: task.task_id!)
            }
            alert.addAction(deleteAction)
            self.present(alert, animated: true)
            
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = toDoTaskList[indexPath.row]
        performSegue(withIdentifier: "goToGuncelle", sender: task)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGuncelle"{
            let task = sender as? ToDoTask
            let destinationVc = segue.destination as! UpdateVc
            destinationVc.task = task
        }
    }
    
}

