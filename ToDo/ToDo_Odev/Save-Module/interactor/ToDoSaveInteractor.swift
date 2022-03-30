//
//  toDoSaveInteractor.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
import UIKit

class ToDoSaveInteractor : PresenterToInteractorToDoSaveProtocol {
    
    let db : FMDatabase?
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("toDoTask.sqlite")
        db = FMDatabase(path: copyPath.path)
    }
    func save(header: String, content: String) {
        
        
        
  
            db?.open()
            do{
                try db?.executeUpdate("INSERT INTO Tasks (task_header,task_content) VALUES (?,?)", values: [header,content])
            }catch {
                
            }
            db?.close()
        

       
    }
    
    
}
