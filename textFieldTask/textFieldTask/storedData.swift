//
//  storedData.swift
//  textFieldTask
//
//  Created by Cheyyeti venkata syam kumar on 1/22/21.
//  Copyright © 2021 Cheyyeti venkata syam kumar. All rights reserved.
//

import UIKit

class storedData: UIViewController {
    
    var backBtn:UIButton!
    var showLbl:UILabel!
    
    var vcscroll:UIScrollView!

    
    
    var recall:ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemTeal
        
        
        vcscroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: 415, height: 900))
        view.addSubview(vcscroll)
        
        
        
        backBtn = UIButton(frame: CGRect(x: 300, y: 55, width: 100, height: 30))
        backBtn.setTitle("BACK", for: UIControl.State.normal)
        backBtn.layer.borderWidth = 5.0
        backBtn.layer.borderColor = UIColor.white.cgColor
        backBtn.backgroundColor = UIColor.systemTeal
        backBtn.layer.cornerRadius = 15
        backBtn.clipsToBounds = true
        backBtn.addTarget(self, action: #selector(backBtnAction), for: UIControl.Event.touchUpInside)
        vcscroll.addSubview(backBtn)
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func backBtnAction(){
        
        dismiss(animated: true){
            
            self.recall.savelab.text = "Enter Your Details"
            
            
            
            
        }
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
