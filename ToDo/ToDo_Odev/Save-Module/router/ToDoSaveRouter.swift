//
//  ToDoSaveRouter.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
class ToDoSaveRouter : PresenterToRouterToDoSaveProtocol {
    
    static func createModule(ref: SaveVc) {
        ref.toDoSavePresenterObject = ToDoSavePresenter() // instance aldığımız değişkenleri çalışması için yetkilendirme veriyoruz.
        ref.toDoSavePresenterObject?.toDoSaveInteractor = ToDoSaveInteractor()
    }
    
    
}
