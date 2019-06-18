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

    }

    // MARK: Button Actions
    
    @IBAction func operatorAC(_ sender: Any) {
        
    }
    
    @IBAction func operatorMoreLess(_ sender: Any) {
        
    }
    
    @IBAction func operatorPercent(_ sender: Any) {
        
    }
    
    @IBAction func operatorDiv(_ sender: Any) {
        
    }
    
    @IBAction func operatoradd(_ sender: Any) {
        
    }
    
    @IBAction func operatorLess(_ sender: Any) {
        
    }
    
    @IBAction func operatorSum(_ sender: Any) {
        
    }
    
    @IBAction func operatorEquas(_ sender: Any) {
        
    }
    
    @IBAction func operatorDecimal(_ sender: Any) {
        
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
    }
    
}
