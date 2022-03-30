//
//  ToDoMainScreenProtocols.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
protocol ViewToPresenterMainVcProtocol {
    var mainVcInteractor : PresenterToInteractorMainVcProtocol? {get set}
    var mainVcView : PresenterToViewMainVcProtocol? {get set}
    func getAllTask()
    func deleteSelected(taskId : Int)
    func searchTask(searchText : String)
}

protocol PresenterToInteractorMainVcProtocol {
    var mainVcPresenter : InteractorToPresenterMainVcProtocol? {get set}
    func getAll()
    func delete(taskId:Int)
    func search(searchText : String)
}



protocol InteractorToPresenterMainVcProtocol {
    func sendListToPresenter(tasksList : Array<ToDoTask>)
}

protocol PresenterToViewMainVcProtocol {
    func sendListToView(tasksList : Array<ToDoTask>)
}

protocol PresenterToRouterMainVcProtocol {
    static func createModule(ref : MainVc )
}
