//
//  ViewController.swift
//  textFieldTask
//
//  Created by Cheyyeti venkata syam kumar on 1/22/21.
//  Copyright © 2021 Cheyyeti venkata syam kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    var firstNameTxtFld:UITextField!
    var lastNameTxtFld:UITextField!
    var ageT:UITextField!
    var emailT:UITextField!
    var mobileNoT:UITextField!
    var saveBtn:UIButton!
    var showBtn:UIButton!
    var taps:UITapGestureRecognizer!
    
    
    
    
    
    
    
    var savelab:UILabel!
    
    var details:[String] = []
    
    
    var array = ["FirstName: ","LastName: ","Age: ","Email: ","Mobile Num: "]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemTeal
        
        createfront()
        
        
        firstNameTxtFld.delegate = self
        lastNameTxtFld.delegate = self
        ageT.delegate = self
        emailT.delegate = self
        mobileNoT.delegate = self
        
        
                // Do any additional setup after loading the view.
    }
    
    
    
    
    func createfront(){
            
                  showBtn = UIButton(frame: CGRect(x: 300, y: 55, width: 100, height: 30))
                  showBtn.setTitle("SHOW", for: UIControl.State.normal)
                  showBtn.layer.borderWidth = 5.0
                  showBtn.layer.borderColor = UIColor.white.cgColor
                  showBtn.backgroundColor = UIColor.systemTeal
                  showBtn.layer.cornerRadius = 15
                  showBtn.clipsToBounds = true
                  showBtn.addTarget(self, action: #selector(showBtnAction), for: UIControl.Event.touchUpInside)
                  view.addSubview(showBtn)
           
            
            
            
            
            firstNameTxtFld = UITextField(frame: CGRect(x: 45, y: 130, width: 325, height: 45))
            firstNameTxtFld.backgroundColor = .white
            firstNameTxtFld.placeholder = "FirstName"
            firstNameTxtFld.borderStyle = .roundedRect
            firstNameTxtFld.clearButtonMode = .whileEditing
            view.addSubview(firstNameTxtFld)
            
    
            
            lastNameTxtFld = UITextField(frame: CGRect(x: 45, y: 200, width: 325, height: 45))
            lastNameTxtFld.backgroundColor = .white
            lastNameTxtFld.placeholder = "lastName"
            lastNameTxtFld.borderStyle = .roundedRect
            lastNameTxtFld.clearButtonMode = .whileEditing
            view.addSubview(lastNameTxtFld)
            
            ageT = UITextField(frame: CGRect(x: 45, y: 270, width: 75, height: 45))
            ageT.backgroundColor = .white
            ageT.placeholder = "Age"
            ageT.borderStyle = .roundedRect
            ageT.keyboardType = .decimalPad
            ageT.keyboardAppearance = .dark
            ageT.clearButtonMode = .whileEditing
            view.addSubview(ageT)
            
            emailT = UITextField(frame: CGRect(x: 45, y: 340, width: 325, height: 45))
            emailT.backgroundColor = .white
            emailT.placeholder = "EMAIL"
            emailT.keyboardType = .emailAddress
            emailT.keyboardAppearance = .light
            emailT.borderStyle = .roundedRect
            emailT.clearButtonMode = .whileEditing
            view.addSubview(emailT)
            
            mobileNoT = UITextField(frame: CGRect(x: 45, y: 410, width: 325, height: 45))
            mobileNoT.backgroundColor = .white
            mobileNoT.placeholder = "Mobile Number"
            mobileNoT.keyboardType = .numberPad
            mobileNoT.keyboardAppearance = .alert
            mobileNoT.borderStyle = .roundedRect
            mobileNoT.clearButtonMode = .whileEditing
            view.addSubview(mobileNoT)
            
            saveBtn = UIButton(frame: CGRect(x: 150, y: 470, width: 100, height: 30))
            saveBtn.setTitle("SAVE", for: UIControl.State.normal)
            saveBtn.isEnabled = false
            saveBtn.layer.borderWidth = 5.0
            saveBtn.layer.borderColor = UIColor.white.cgColor
            saveBtn.backgroundColor = UIColor.systemTeal
            saveBtn.layer.cornerRadius = 15
            saveBtn.clipsToBounds = true
            
            saveBtn.addTarget(self, action: #selector(saveBtnAction), for: UIControl.Event.touchUpInside)
            //saveBtn.addTarget(self, action: #selector(textFieldIsNotEmpty(sender:)), for: UIControl.Event.touchUpInside)
           
            view.addSubview(saveBtn)
            
            
            
            
            taps = UITapGestureRecognizer(target: self, action: #selector(tapAction))
            view.addGestureRecognizer(taps)
         
         
        }
    
    
    
    
    @objc func tapAction(){
        view.endEditing(true)
    }
    
    @objc func saveBtnAction(){
        
        
        
        
        if let item = firstNameTxtFld.text , item.isEmpty == false
        {
            details.append("firstName : \(item)")
        }
        
        
        if let item = lastNameTxtFld.text , item.isEmpty == false
        {
            details.append("LastName : \(item)")
        }
        
        if let item = ageT.text , item.isEmpty == false
        {
            details.append("Age :\(item)")
        }
        
        if let item = emailT.text , item.isEmpty == false
        {
            details.append("Email:\(item)")
        }
        
        if let item = mobileNoT.text , item.isEmpty == false
        {
            details.append("Mobile No:\(item)")
        }
        
       
        
            savelab = UILabel(frame: CGRect(x: 75, y: 550, width: 250, height: 50))
            savelab.text = "Your Data Saved"
            savelab.textAlignment = .center
            savelab.layer.borderWidth = 5.0
            savelab.layer.borderColor = UIColor.white.cgColor
            savelab.backgroundColor = UIColor.systemTeal
            savelab.layer.cornerRadius = 15.0
            savelab.clipsToBounds = true
            view.addSubview(savelab)
        
        
        firstNameTxtFld.text = nil
        lastNameTxtFld.text = nil
        ageT.text = nil
        emailT.text = nil
        mobileNoT.text = nil
        
        saveBtn.isEnabled = false
        
       
               
        
        
    }
    
    
    
    

    
    
    
    @objc func showBtnAction(){
        
        
        
        if details == []
        {
            //showBtn.isHidden = true
        }
        else
        {
        
        let nv = storyboard?.instantiateViewController(identifier: "Stored") as! storedData
        nv.modalPresentationStyle = .overFullScreen
        
        present(nv,animated: true){
            
            nv.recall = self
            
            
            var a = 0
            
            
            for i in 0..<self.details.count{
            
            nv.showLbl = UILabel(frame: CGRect(x: 20, y: 75+a*50, width: 200, height: 50))
                nv.vcscroll.addSubview(nv.showLbl)
                
                nv.showLbl.text = "\(self.details[i])"
                nv.showLbl.textColor = .red
                

                a += 1
                
                
                if i%5 == 4
                {
                    
                    a += 1
                }
                
        }
            nv.vcscroll.contentSize = CGSize(width: nv.showLbl.frame.maxX, height: nv.showLbl.frame.maxY)
        }
        }
        
    }
    
    
    
    
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        print("textFieldShouldBeginEditing")
        
        var returnValue:Bool = false
        
        if(textField == firstNameTxtFld)
        {
            returnValue = true
        }else if(textField == lastNameTxtFld)
        {
            if(firstNameTxtFld.text!.count > 0)
            {
                returnValue = true
            }else
            {
                returnValue = false
            }
        }else if(textField == ageT)
        {
            if(firstNameTxtFld.text!.count > 0 && lastNameTxtFld.text!.count > 0)
            {
                returnValue = true
            }else
            {
                returnValue = false
            }
        }else if(textField == emailT)
        {
            if(firstNameTxtFld.text!.count > 0 && lastNameTxtFld.text!.count > 0 && Int(ageT.text!)! >= 10 && Int(ageT.text!)! <= 120)
            {
                returnValue = true
            }else
            {
                returnValue = false
            }
        }else if(textField == mobileNoT)
        {
            if(firstNameTxtFld.text!.count > 0 && lastNameTxtFld.text!.count > 0 && Int(ageT.text!.count) > 0 && emailT.text!.count >= 7)
            {
                returnValue = true
               // saveBtn.isEnabled = true
            }else
            {
                returnValue = false
            }
        }
        
        return returnValue
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        print("textFieldShouldEndEditing")
        
        var returnValue = true;
        
        if(textField == firstNameTxtFld)
        {
            if(firstNameTxtFld.text!.count >= 3)
            {
                returnValue = true
            }else
            {
                returnValue = false
            }
        }else if(textField == emailT)
        {
            return isValidEmail(textField.text!)
        }else if(textField == mobileNoT)
        {
            return isValidPhone(textField.text!)
        }
        return returnValue
    }
    
    
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPhone(_ phone: String) -> Bool {
        
        let phoneNumberRegex = "^[6-9][0-9]{9}$";
        let phoneTest = NSPredicate(format: "SELF MATCHES %@",phoneNumberRegex)
        
        let result = phoneTest.evaluate(with: phone)
        return result
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.backgroundColor = UIColor.cyan
        print("textFieldDidBeginEditing")
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        textField.backgroundColor = UIColor.white
        print("textFieldDidEndEditing")
        
        if(firstNameTxtFld.text!.count != 0) && (lastNameTxtFld.text!.count != 0) && Int(ageT.text!.count) > 0 && (emailT.text!.count) > 7 && (mobileNoT.text!.count == 10){
                   saveBtn.isEnabled = true
        }
        
        
        
        
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("shouldChangeCharactersIn ----> \(string)")
        
        if(string == "")
        {
            print("backSpace detected")
            return true
        }
        
       // var returnValue = true;
        
        if(textField == firstNameTxtFld || textField == lastNameTxtFld)
        {
            var firstNameAndLastNameAllowableCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
            
            if(string.rangeOfCharacter(from: firstNameAndLastNameAllowableCharacters) != nil)
            {
                return  true
            }else
            {
                return  false
            }
        }else if(textField == ageT)
        {
            var ageAllowableCharacters = CharacterSet(charactersIn: "0123456789")
            
            
            if(string.rangeOfCharacter(from: ageAllowableCharacters) != nil)
            {
                return true
            }else
            {
                return false
            }
            
        }else if(textField == emailT)
        {
            var emailAllowableCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_.@")
            
            if(string.rangeOfCharacter(from: emailAllowableCharacters) != nil)
            {
                return  true
            }else
            {
                return false
            }
            
        }else if (textField == mobileNoT)
        {
            
            if textField.text == ""
            {
                if  string == "6" || string == "7" || string == "8" || string == "9"
                {
                    return true
                }
                else
                {
                    return false
                }
                
                
                
                
            }
            else
            {
                let currentCharacterCount = textField.text?.count ?? 0
                
                if currentCharacterCount <= 9
                {
                                        
                     saveBtn.isEnabled = true
                    return true
                }
                else
                {
                    return false
                }


                
            }
                
//                let mobile = CharacterSet(charactersIn: "0123456789+-")
//                if (string.rangeOfCharacter(from: mobile) != nil){
//
//                    if textField == mobileNoT
//
//                    {
//
//                        let currentCharacterCount = textField.text?.count ?? 0
//
//                        if range.length + range.location > currentCharacterCount {
//
//                            return false
//
//                        }
//
//                        let newLength = currentCharacterCount + string.count - range.length
//
//                        return newLength <= 10
//
//                    }
//
//                  return true
//                }else{
//                    return false
//                }

                
        }
        
        
        return true
    }
    
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        print("textFieldShouldClear")
        
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        print("textFieldShouldReturn")
        
        return true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    


}

