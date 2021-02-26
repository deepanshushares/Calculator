//
//  ViewController.swift
//  SimpleCalculator2
//
//  Created by Deepanshu Jain on 09/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var additionLabel: UILabel!
    @IBOutlet weak var subtractionLabel: UILabel!
    @IBOutlet weak var multiplicationLabel: UILabel!
    @IBOutlet weak var remainderLabel: UILabel!
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var mulLabel: UILabel!
    @IBOutlet weak var remLabel: UILabel!
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Other Functions
    func setupUI() {
        self.hideKeyboardWhenTappedAround()
        updateHiddenStatus(to: true)
    }
    
    func updateHiddenStatus(to value: Bool) {
        addLabel.isHidden = value
        subLabel.isHidden = value
        mulLabel.isHidden = value
        remLabel.isHidden = value
        additionLabel.isHidden = value
        subtractionLabel.isHidden = value
        multiplicationLabel.isHidden = value
        remainderLabel.isHidden = value
    }
    
    func updateTextfields() {
        firstTextField.text = nil
        secondTextField.text = nil
    }
    
    // MARK: - IBActions
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let firstString = firstTextField.text,
              let firstNumber = Int(firstString),
              let secondString = secondTextField.text,
              let secondNumber = Int(secondString) else { return }
        
        additionLabel.text = String(firstNumber + secondNumber)
        subtractionLabel.text = String(firstNumber - secondNumber)
        multiplicationLabel.text = String(firstNumber * secondNumber)
        remainderLabel.text = secondNumber == 0 ? "NA" : String(firstNumber % secondNumber)
        
        updateTextfields()
        updateHiddenStatus(to: false)
    }
}

// MARK: - Keyboard Functionality
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
