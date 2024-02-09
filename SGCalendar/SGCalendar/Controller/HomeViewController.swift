//
//  ViewController.swift

//
//  Created by Shashi Gupta on 09/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openCalendar(_ sender: UIButton) {
        
        if let viewController = UIStoryboard(name: "SB_Calendar", bundle: nil).instantiateViewController(withIdentifier: "DatePickerViewController") as? DatePickerViewController{
            
            //:
            viewController.minimumDate = Date()
            
            viewController.view.backgroundColor = .black.withAlphaComponent(0.3)
            viewController.modalPresentationStyle = .overCurrentContext
            self.present(viewController, animated: true)
        }
    }
    
}

