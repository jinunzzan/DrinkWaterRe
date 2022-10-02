//
//  ViewController.swift
//  DrinkWater
//
//  Created by Eunchan Kim on 2022/09/28.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var perposerWater = 0.0 // 하루권장량
    var purposeWaterPer = 0.0 // 목표대비퍼센트
    var totalWater = 0.0
    // 오늘 마신 양
    var insertWater = 0
    
    @IBOutlet weak var btnWater: UIButton!
    
    @IBOutlet weak var purWater100: UILabel!
    @IBOutlet weak var imgaeView: UIImageView!
    @IBOutlet weak var labelGoodjob: UILabel!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var yourWater: UILabel!
    @IBOutlet weak var profileBtn: UIBarButtonItem!
    @IBOutlet weak var ml: UILabel!
    @IBOutlet weak var textFieldWater: UITextField!
   
    
    let images = ["1-1","1-2", "1-3", "1-4", "1-5", "1-6", "1-7", "1-8", "1-9"]
    var currentIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDisplay()
        
        textFieldWater.delegate = self
    }
    
    private func setDisplay() {
        if ((UserDefaults.standard.string(forKey: "nickname")?.isEmpty) == nil) {
            yourWater.text = ""
        }
    
        print("첫번재화면")
        self.navigationController?.navigationBar.tintColor = .white
        
        self.view.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 115/255, alpha: 1)

        labelGoodjob.sizeToFit()
        labelGoodjob.text = "마신 물의 양을 \n입력하세요"
        labelGoodjob.textColor = .white
        labelGoodjob.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        
        //yourWater
        yourWater.textColor = .white
        
        yourWater.textAlignment = .center
        yourWater.font = UIFont.systemFont(ofSize: 13)
        
        //textfield
        textFieldWater.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 115/255, alpha: 1)
        textFieldWater.borderStyle = .none
        textFieldWater.font = UIFont.systemFont(ofSize: 40)
        textFieldWater.textColor = .white
        
        yourWater.text = "\(UserDefaults.standard.string(forKey: "nickname") ?? "")님의 하루 물 섭취 권장량은 \(Double((UserDefaults.standard.integer(forKey: "height") + UserDefaults.standard.integer(forKey: "weight")) / 100))L 입니다"
       
    }
    
    @IBAction func waterBtn(_ sender: UIButton) {
        labelGoodjob.text = "잘하셨어요!\n오늘 마신 양은"
        
        perposerWater = Double((UserDefaults.standard.integer(forKey: "height") + UserDefaults.standard.integer(forKey: "weight")) / 100)
        yourWater.text = "\(UserDefaults.standard.string(forKey: "nickname") ?? "")님의 하루 물 섭취 권장량은 \(perposerWater)L 입니다"
        print(perposerWater)
        //  (160 + 50) / 100  2.1 L
        
        //총 마신양 구하기
        let insertWaterSet = textFieldWater.text
        print("textwater: \(type(of: insertWaterSet))")
        UserDefaults.standard.set(insertWaterSet, forKey: "water")
        
        totalWater += Double(UserDefaults.standard.integer(forKey: "water"))
        
        print(totalWater)
        
        //목표의 몇퍼센트구하기
        //        totalWater += UserDefaults.standard.double(forKey: "water")
        purposeWaterPer = (Double(totalWater) / Double((perposerWater * 1000))) * 100
        let waterPer = String(format: "%.0f", purposeWaterPer)
        let totalWater = String(format: "%.0f", totalWater)
        print(totalWater)
        
        //퍼센트
        // 출력
        // 퍼센트
        percent.textColor = .white
        percent.text = "목표의 \(waterPer)%"
        percent.font = UIFont.systemFont(ofSize: 15)
        // 오늘 섭취량
        ml.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
       
        ml.text = "\(totalWater)ml"
        ml.textColor = .white
        
        textFieldWater.text = "\(insertWaterSet ?? "")ml"
        
        //이미지 바꾸기
        
        let image:UIImage? = UIImage(named: images[currentIndex])
        imgaeView.image = image
        
        if purposeWaterPer >= 0 {
           
            imgaeView.image = UIImage(named: images[0])
        }
        if purposeWaterPer >= 20 {
            
             imgaeView.image = UIImage(named: images[1])
        }
        if purposeWaterPer >= 30 {
            
             imgaeView.image = UIImage(named: images[2])
        }
        if purposeWaterPer >= 40.0 {
            
             imgaeView.image = UIImage(named: images[3])
        }
        if purposeWaterPer >= 50.0 {
            
             imgaeView.image = UIImage(named: images[4])
        }
        if purposeWaterPer >= 60.0 {
            
             imgaeView.image = UIImage(named: images[5])
        }
        if purposeWaterPer >= 70.0 {
            
             imgaeView.image = UIImage(named: images[6])
        }
        if purposeWaterPer >= 80.0 {
           
             imgaeView.image = UIImage(named: images[7])
        }
        if purposeWaterPer == 100.0 {
            
             imgaeView.image = UIImage(named: images[8])
            btnWater.isEnabled = false
            
//            shakeTextField(textField: textFieldWater)
            purWater100.text = "목표 섭취 권장량을 달성하셨습니다"
            purWater100.textColor = .white
            purWater100.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            purWater100.textAlignment = .center
            
       }
      
        
        
      
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldWater.text = ""
    }
    
    
    @IBAction func resetBtn(_ sender: UIButton) {
        
        percent.text = ""
        ml.text = ""
        totalWater = 0.0
        insertWater = 0
        purposeWaterPer = 0.0
        textFieldWater.text = ""
        imgaeView.image = UIImage(named: images[0])
        labelGoodjob.text = "마신 물의 양을 \n입력하세요"
        purWater100.text = ""
        UserDefaults.standard.removeObject(forKey: "water")
        btnWater.isEnabled = true
        
        if ((UserDefaults.standard.string(forKey: "nickname")?.isEmpty) == nil) {
            yourWater.text = ""
        }
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func shakeTextField(textField: UITextField)-> Void {
        UIView.animate(withDuration: 0.2, animations: {
                textField.frame.origin.x -= 10
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x += 20
                 }, completion: { _ in
                     UIView.animate(withDuration: 0.2, animations: {
                        textField.frame.origin.x -= 10
                    })
                })
            })
        //
       
    }
    
}
