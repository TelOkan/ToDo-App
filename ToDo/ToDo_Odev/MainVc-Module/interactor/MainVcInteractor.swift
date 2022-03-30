//
//  MainVcInteractor.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
class MainVcInteractor : PresenterToInteractorMainVcProtocol {
       var mainVcPresenter : InteractorToPresenterMainVcProtocol?
    
    
    let db : FMDatabase?
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("toDoTask.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    
    
    func getAll() {
        var taskList = [ToDoTask]()
        db?.open()
        do{
            let query = try db!.executeQuery("SELECT * From Tasks", values: nil)
            
            while query.next(){
                let task_id = Int(query.string(forColumn: "task_id"))!
                let task_header = (query.string(forColumn: "task_header"))!
                let task_content = (query.string(forColumn: "task_content"))!
                let task = ToDoTask(task_id: task_id, task_header: task_header, task_content: task_content)
                taskList.append(task)
            }
            mainVcPresenter?.sendListToPresenter(tasksList: taskList)
        }catch {
            
        }
        db?.close()
  
        
    }
    
    
    func delete(taskId: Int) {
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM Tasks WHERE task_id = ?", values: [taskId])
            getAll()
        }catch {
            
        }
        db?.close()
       
    }
    
    func search(searchText: String) {
        var taskList = [ToDoTask]()
        db?.open()
        do{
            let query = try db!.executeQuery("SELECT * FROM Tasks WHERE task_header like '%\(searchText)%'", values: nil)
            
            while query.next(){
                let task_id = Int(query.string(forColumn: "task_id"))!
                let task_header = (query.string(forColumn: "task_header"))!
                let task_content = (query.string(forColumn: "task_content"))!
                let task = ToDoTask(task_id: task_id, task_header: task_header, task_content: task_content)
                taskList.append(task)
            }
            mainVcPresenter?.sendListToPresenter(tasksList: taskList)
        }catch {
            
        }
        db?.close()
       
    }
    
}
