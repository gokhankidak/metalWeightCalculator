//
//  CalculatorViewController.swift
//  metalWeightCalculator
//
//  Created by Gökhan Kıdak on 23.09.2023.
//

import Foundation
import UIKit

class CalculatorViewController : ViewController
{
    let densityPickerView = UIPickerView()
    var solidCalc : SolidCalculator?
    
    var densityCart = ["steel" : 7.86,"aluminium":2.71,"cooper":8.96,"stainless steel" : 7.89,"cast iron" : 7.6]
    var keys = ["steel","aluminium","cooper","stainless steel","cast iron"]
    
    @IBOutlet weak var densityLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var densityTextField: UITextField!
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var solidMatImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var parameterLabels : [UILabel]!
    @IBOutlet var textFields : [UITextField]!
    @IBOutlet var parameterViews : [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFields()
        densityTextField.inputView = densityPickerView
        
        densityTextField.delegate = self
        densityPickerView.delegate = self
        densityPickerView.dataSource = self
        
    }
    
    func prepareUI()
    {
        if let solidCalc = solidCalc
        {
            print(solidCalc.imageResource)
            solidMatImageView.image = UIImage(resource: solidCalc.imageResource)
            let parameterCount = solidCalc.parameterCount
            
            for i in 0...parameterCount - 1 {
                parameterViews[i].isHidden = false
                parameterLabels[i].text = solidCalc.parameterNames[i]
            }
            if(parameterCount < parameterViews.count){
                for i in parameterCount...parameterViews.count - 1{
                    parameterViews[i].isHidden = true
                }
            }
        }
    }
    
    func setTextFields()
    {
        densityTextField.becomeFirstResponder()
        for textField in textFields {
            textField.keyboardType = .decimalPad
        }
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let mmToCm:Float = 1000
        
        let a = Float(textFields[0].text ?? "0.0") ?? 0.0
        let b = Float(textFields[1].text ?? "0.0") ?? 0.0
        let c = Float(textFields[2].text ?? "0.0") ?? 0.0
        let d = Float(textFields[3].text ?? "0.0") ?? 0.0
        
        do{
            if let volume = try solidCalc?.CalculateVolume(a:a, b: b, c: c, d: d)
            {
                let convertedVolume = volume/mmToCm
                if let density = Float(densityTextField.text!)
                {
                    resultLabel.text = String( convertedVolume * density)
                }
            }
            
        }
        catch{
            let alert = UIAlertController(title: "Error", message: "Enter valid values", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension CalculatorViewController : UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return densityCart.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keys[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        densityTextField.text = String( densityCart[keys[row]] ?? 0)
        materialLabel.text = keys[row]
        self.view.endEditing(true)
    }
}

extension CalculatorViewController : UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        materialLabel.text = ""
    }

}





