//
//  UpdateProtocols.swift
//  ToDo_Odev
//
//  Created by Okan on 19.03.2022.
//

import Foundation
protocol ViewToPresenterUpdateProtocol {
    var updateInteractor : PresenterToInteractorUpdateProtocol? {get set}
    func taskUpdate(taskId : Int, taskHeader : String, taskContent : String)
}

protocol PresenterToInteractorUpdateProtocol{
    func update(taskId : Int, taskHeader : String, taskContent : String)
}


protocol PresenterToRouterUpdateProtocol{
    static func createModule(ref : UpdateVc)
}
