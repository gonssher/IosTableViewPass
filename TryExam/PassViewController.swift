//
//  PassViewController.swift
//  TryExam
//
//  Created by Sherwin Gonsalves on 2020-12-14.
//

import UIKit

class PassViewController: UIViewController {

    
    @IBOutlet weak var iamge: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lanNumver: UILabel!
    @IBOutlet weak var Phonenumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    
    var userEmail = ""
    var userName = ""
    var landlineNumebr = ""
    var cellphone = ""
    var NewImage : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        name.text = userName
        email.text = userEmail
        lanNumver.text = landlineNumebr
        Phonenumber.text = cellphone

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
