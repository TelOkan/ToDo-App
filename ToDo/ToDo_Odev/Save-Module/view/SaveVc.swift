//
//  KayitVc.swift
//  ToDo_Odev
//
//  Created by Okan on 17.03.2022.
//

import UIKit

class SaveVc: UIViewController {

    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var headerTextField: UITextField!
    var toDoSavePresenterObject : ViewToPresenterToDoSaveProtocol?  //biz burada inheritance vermiş oluyoruz dimi ?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        ToDoSaveRouter.createModule(ref: self)
    
    }
    
    @IBAction func kaydetButton(_ sender: Any) {
        
        
        if let header = headerTextField.text , let content = contentTextView.text {
            if  header != "" && content != ""{
                toDoSavePresenterObject?.toDoSave(header: header, content: content)
                navigationController?.popToRootViewController(animated: true) //this line will be lead user to main page
            }else {
                let alertController = UIAlertController(title: "Kayıt Hatası", message: "Başlık veya içerik boş olamaz.Lütfen ilgili alanları doldurunuz.", preferredStyle: .alert)
                let tamamAction = UIAlertAction(title: "Tamam", style: .cancel){ action in
                }
                alertController.addAction(tamamAction)
                self.present(alertController, animated: true)
            }
        }

       
        
    }
    
   

}
