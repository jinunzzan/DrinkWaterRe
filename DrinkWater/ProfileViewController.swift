//
//  ViewController2.swift
//  DrinkWater
//
//  Created by Eunchan Kim on 2022/09/28.
//

import UIKit

class ProfileViewController: UIViewController {


    @IBOutlet weak var lblNickname: UILabel!
    
    @IBOutlet weak var lblheight: UILabel!
    
    @IBOutlet weak var lblWeght: UILabel!
    
    
    @IBOutlet weak var tfNickname: UITextField!
    
    
    @IBOutlet weak var tfHeight: UITextField!
    
    
    @IBOutlet weak var tfWeight: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.tintColor = .white
       
        self.view.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 115/255, alpha: 1)
        
        lblNickname.text = "닉네임을 설정해주세요"
        lblNickname.textColor = .white
        lblNickname.font = UIFont.systemFont(ofSize: 14)
        
        lblheight.text = "키(cm)를 설정해주세요"
        lblheight.textColor = .white
        lblheight.font = UIFont.systemFont(ofSize: 14)
        
        lblWeght.text = "몸무게(kg)를 설정해주세요"
        lblWeght.textColor = .white
        lblWeght.font = UIFont.systemFont(ofSize: 14)
        
        ///textField
        tfNickname.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 115/255, alpha: 1)
        tfNickname.borderStyle = .none
        tfNickname.placeholder = "닉네임을 입력해주세요"
       
        tfHeight.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 115/255, alpha: 1)
        tfHeight.borderStyle = .none
        tfHeight.placeholder = "키를 입력해주세요"
        
        tfWeight.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 115/255, alpha: 1)
        tfWeight.borderStyle = .none
        tfWeight.placeholder = "몸무게를 입력해주세요"
        
      
    }

    @IBAction func saveBtn(_ sender: Any) {
        
        
       
        let userNickNameSet = tfNickname.text
        UserDefaults.standard.set(userNickNameSet, forKey: "nickname")
        
       
        let userHeightSet = tfHeight.text
        UserDefaults.standard.set(userHeightSet, forKey: "height")
        
        
       
        let userWeightSet = tfWeight.text
        UserDefaults.standard.set(userWeightSet, forKey: "weight")
        
        print(userNickNameSet ?? "")
        print(userHeightSet ?? 0)
        print(userWeightSet ?? 0)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
    
}
