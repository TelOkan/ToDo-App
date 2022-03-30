//
//  ToDoSavePresenter.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
class ToDoSavePresenter : ViewToPresenterToDoSaveProtocol {
    
    var toDoSaveInteractor: PresenterToInteractorToDoSaveProtocol?
    
    func toDoSave(header: String, content: String) {
        toDoSaveInteractor?.save(header: header, content: content)
    }
    
    
}
