//
//  MainVcRouter.swift
//  ToDo_Odev
//
//  Created by Okan on 18.03.2022.
//

import Foundation
class MainVcRouter : PresenterToRouterMainVcProtocol{
    
    static func createModule(ref: MainVc) {
        let presenter = MainVcPresenter()
        
        //View İçin
        ref.mainVcPresenterObject = presenter
        
        //Presenter İçin
        ref.mainVcPresenterObject?.mainVcView = ref
        ref.mainVcPresenterObject?.mainVcInteractor = MainVcInteractor()
        
        //Interactor İçin
        ref.mainVcPresenterObject?.mainVcInteractor?.mainVcPresenter = presenter 
        
    }
    
    
    

}
