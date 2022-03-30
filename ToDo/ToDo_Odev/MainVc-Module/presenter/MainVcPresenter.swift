//
//  MainVcPresenter.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
class MainVcPresenter : ViewToPresenterMainVcProtocol{
    
    
    
    
    
    var mainVcInteractor: PresenterToInteractorMainVcProtocol?
    
    var mainVcView: PresenterToViewMainVcProtocol?
    
    func getAllTask() {
        mainVcInteractor?.getAll()
    }
    
    func deleteSelected(taskId: Int) {
        mainVcInteractor?.delete(taskId: taskId)
    }
    
    
    func searchTask(searchText: String) {
        mainVcInteractor?.search(searchText: searchText)
    }
}

extension MainVcPresenter : InteractorToPresenterMainVcProtocol {
    func sendListToPresenter(tasksList: Array<ToDoTask>) {
        mainVcView?.sendListToView(tasksList: tasksList)
       
    }
    

    
    
}
