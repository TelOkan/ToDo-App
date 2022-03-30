//
//  UpdateInteractor.swift
//  ToDo_Odev
//
//  Created by Okan on 19.03.2022.
//

import Foundation
class UpdateInteractor : PresenterToInteractorUpdateProtocol {
    let db : FMDatabase?
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("toDoTask.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    func update(taskId: Int, taskHeader: String, taskContent: String) {
        db?.open()
        do{
            try db?.executeUpdate("UPDATE Tasks SET task_header = ? ,task_content = ? WHERE task_id = ?", values: [taskHeader,taskContent,taskId])
        }catch {
            
        }
        db?.close()
    }
    
    
   
}
