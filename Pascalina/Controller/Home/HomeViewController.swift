//
//  HomeViewController.swift
//  Pascalina
//
//  Created by Jesús Calderón on 18/06/2019.
//  Copyright © 2019 Prueba. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    
    
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorMoreLess: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorDiv: UIButton!
    @IBOutlet weak var operatoradd: UIButton!
    @IBOutlet weak var operatorLess: UIButton!
    @IBOutlet weak var operatorSum: UIButton!
    @IBOutlet weak var operatorEquas: UIButton!
    @IBOutlet weak var operatorDecimal: UIButton!
    
    // MARK: Variables
    
    private var total: Double = 0
    private var temp: Double = 0
    private var operating = false
    private var decimal = false
    private var operation: OperationType = .none
    
    // MARK: Constants
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLength = 9
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.00000001
    
    private enum OperationType {
        case none, addiction, substraction, multiplication, division, percent
    }
    
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // MARK: Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        operatorAC.round()
        operatorMoreLess.round()
        operatorPercent.round()
        operatorDiv.round()
        operatoradd.round()
        operatorLess.round()
        operatorSum.round()
        operatorEquas.round()
        operatorDecimal.round()
        
        operatorDecimal.setTitle(kDecimalSeparator, for: .normal)

        result()
    }

    // MARK: Button Actions
    
    @IBAction func operatorAC(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func operatorMoreLess(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operatorPercent(_ sender: UIButton) {
        
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorDiv(_ sender: UIButton) {
        
        result()
        operating = true
        operation = .division
        
        sender.shine()
    }
    
    @IBAction func operatoradd(_ sender: UIButton) {
        
        result()
        operating = true
        operation = .multiplication
        
        sender.shine()
    }
    
    @IBAction func operatorLess(_ sender: UIButton) {
        
        result()
        operating = true
        operation = .substraction
        
        sender.shine()
    }
    
    @IBAction func operatorSum(_ sender: UIButton) {
        
        result()
        operating = true
        operation = .addiction
        
        sender.shine()
    }
    
    @IBAction func operatorEquas(_ sender: UIButton) {
        sender.shine()
    }
    
    @IBAction func operatorDecimal(_ sender: UIButton) {
        
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        
        
        operatorAC.setTitle("C", for: .normal)
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    private func result() {
        
        switch operation {
        case .none:
            break
        case .addiction:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            total = temp / 100
            total = temp
            break
        }
        
        if total <= kMaxValue || total >= kMinValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        print("Total: \(total)")
        
    }
    
}
