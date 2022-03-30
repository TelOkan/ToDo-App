//
//  toDoTask.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
class ToDoTask {
    
    var task_id : Int?
    var task_header : String?
    var task_content : String?
    
    init(task_id : Int, task_header : String, task_content : String){
        self.task_id = task_id
        self.task_header = task_header
        self.task_content = task_content
        
    }
}
