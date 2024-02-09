//
//  VC_CustomDatePicker.swift
 // SGCalendar
//
//  Created by Shashi Gupta on 02/04/23.
//

import UIKit


class DatePickerViewController: UIViewController {

    //MARK: -
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - VARIABLES
    static let identifier = "VC_DatePicker"
    var titleText:String = "Select Date"
    var doneButtonTitle:String = "Done"
    var openingDate:Date?
    var mode:UIDatePicker.Mode = .date
    var minimumDate:Date?
    var maximumDate:Date?
    
    var action:String = String()
    var isDateChangeActive:Bool = false
    
    private var selectedDateCallback: ((Date) -> Void)?
    
    //MARK: - INTERNAL FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initials()
        
        self.configureDatePicker()
        
        
    }

    //MARK: - FUNCTIONS
    func initials(){
        
        self.containerView.roundCorners(corners: [.topLeft, .topRight], amount: 16)
        
        self.lblTitle.text = titleText
        
        self.btnDone.setTitle(doneButtonTitle, for: .normal)
        
    }
    
    func configureDatePicker(){
        
        //: Set opening date
        if let date = self.openingDate{
            datePicker.date = date
        }
        
        //: Set date picker mode
        datePicker.datePickerMode = mode
        
        //:
        if let date = self.minimumDate{
            datePicker.minimumDate = date
        }
        
        //:
        if let date = self.maximumDate{
            datePicker.maximumDate = date
        }
        
        //:
        if isDateChangeActive{
            datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        }
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        
//        if Singleton.shareInstance.lng == "ar"{
//            datePicker.locale = Locale(identifier: "ar")
//        }
//        else{
//            datePicker.locale = Locale(identifier: "en")
//        }
        
    }
    
    func getSelectedDate(callback:@escaping (Date) -> Void){
        self.selectedDateCallback = callback
        
    }
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        self.selectedDateCallback?(self.datePicker.date)
    }
    
    //MARK: - ACTION FUNCTIONS
    @IBAction func dismissScreen(_ sender: UIButton) {

        UIView.animate(withDuration: 0.3, delay: 0) {
            self.dismiss(animated: false, completion: nil)
        }
        
        
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.dismiss(animated: false) {
            self.selectedDateCallback?(self.datePicker.date)
        }
    }
    

}
