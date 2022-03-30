//
//  UpdateRouter.swift
//  ToDo_Odev
//
//  Created by Okan on 19.03.2022.
//

import Foundation
class UpdateRouter : PresenterToRouterUpdateProtocol {
    static func createModule(ref: UpdateVc) {
        
        
        ref.updatePresenterObject = UpdatePresenter()
        ref.updatePresenterObject?.updateInteractor = UpdateInteractor()
    }
    
    
}
