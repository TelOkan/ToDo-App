//
//  UpdatePresenter.swift
//  ToDo_Odev
//
//  Created by Okan on 19.03.2022.
//

import Foundation
class UpdatePresenter : ViewToPresenterUpdateProtocol {
    
    
    var updateInteractor: PresenterToInteractorUpdateProtocol?
    
   
    
    func taskUpdate(taskId: Int, taskHeader: String, taskContent: String) {
        updateInteractor?.update(taskId: taskId, taskHeader: taskHeader, taskContent: taskContent)
    }
}
