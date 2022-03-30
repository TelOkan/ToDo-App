//
//  toDoKayitProtocols.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
protocol ViewToPresenterToDoSaveProtocol {
    
    var toDoSaveInteractor : PresenterToInteractorToDoSaveProtocol? {get set} //neden burada soru işareti ve neden burada computed properties kullandık.
    func toDoSave(header : String , content : String )
}

protocol PresenterToInteractorToDoSaveProtocol {
    
    func save(header : String , content : String )
}

protocol PresenterToRouterToDoSaveProtocol {
    static func createModule(ref : SaveVc)  //neden burada static bir yapı kullandık ?
}
