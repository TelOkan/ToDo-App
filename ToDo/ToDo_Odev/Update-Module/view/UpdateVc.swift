//
//  UpdateVc.swift
//  ToDo_Odev
//
//  Created by Okan on 17.03.2022.
//

import UIKit

class UpdateVc: UIViewController {

    @IBOutlet weak var headerTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var task : ToDoTask?
    var updatePresenterObject : ViewToPresenterUpdateProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let task = self.task {
            headerTextField.text = task.task_header
            contentTextView.text = task.task_content
        }
        UpdateRouter.createModule(ref: self)
    }
    


    @IBAction func updateButton(_ sender: Any) {
        if let header = headerTextField.text , let content = contentTextView.text , let task = self.task{
            updatePresenterObject?.taskUpdate(taskId: task.task_id!, taskHeader: header, taskContent: content)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
