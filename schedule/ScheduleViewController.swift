//
//  ViewController.swift
//  schedule
//
//  Created by Флоранс on 04.12.2023.
//

import UIKit

class ScheduleViewController: UIViewController, SetSelectedDirection {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var dateStackView: UIStackView!
    @IBOutlet weak var wayView: UIView!
    
    @IBOutlet weak var todayBtn: UIButton!
    @IBOutlet weak var tomorrowBtn: UIButton!
    @IBOutlet weak var dateBtn: UIButton!
    
    private var chosenDate: String?
    private var chosenTransport: String?
    private var selectedDirection: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        fromTextField.borderStyle = .none
        toTextField.borderStyle = .none
        
        fromTextField.delegate = self
        toTextField.delegate = self
        
        ApiClient.shared.getSchedule()
        
        wayView.layer.masksToBounds = true
        wayView.layer.cornerRadius = 4
        wayView.layer.borderWidth = 1.0
        wayView.layer.borderColor = UIColor.systemGray4.cgColor
        
        todayBtn.layer.masksToBounds = true
        dateBtn.layer.masksToBounds = true
        todayBtn.round(corners: [.bottomLeft, .topLeft], radius: 4)
        dateBtn.round(corners: [.bottomRight, .topRight], radius: 4)
    }
    
    func setDirection(direction: String, isFrom: Bool) {
        selectedDirection = direction
        if isFrom {
            fromTextField.text = direction
            fromTextField.resignFirstResponder()
        } else {
            toTextField.text = direction
            fromTextField.resignFirstResponder()
        }
    }
    
    @IBAction func todayBtnTapped(_ sender: Any) {
    }
    
    @IBAction func tomorrowBtnTapped(_ sender: Any) {
    }
    
    @IBAction func dateBtnTapped(_ sender: Any) {
    }
    
    @IBAction func anyTransportTapped(_ sender: Any) {
    }
    
    @IBAction func byPlaneTapped(_ sender: Any) {
    }
    
    @IBAction func byTrainTapped(_ sender: Any) {
    }
    
    @IBAction func subwayTapped(_ sender: Any) {
    }
    
    @IBAction func byBusTapped(_ sender: Any) {
    }
    
    @IBAction func tapToFindSchedule(_ sender: Any) {
    }
    
    @IBAction func changeDirections(_ sender: Any) {
        let from = fromTextField.text
        let to = toTextField.text
        fromTextField.text = to
        toTextField.text = from
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        return cell
    }
    
}

extension ScheduleViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let storyboard = UIStoryboard(name: "StationsList", bundle: nil)
        
        guard let cityVC = storyboard.instantiateViewController(identifier: "CitiesPopOver") as? CitiesViewController else {
            print("Something wrong in storyboard")
            return
        }
        cityVC.modalPresentationStyle = .popover
        cityVC.delegate = self

        switch textField.tag {
        case 1:
            cityVC.isFrom = true
        case 2:
            cityVC.isFrom = false
        default:
            break
        }
        
        present(cityVC, animated: true, completion: nil)

    }
}

protocol SetSelectedDirection {
    func setDirection(direction: String, isFrom: Bool)
}

//extension ScheduleViewController: UIPopoverPresentationControllerDelegate {
//
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return .none
//    }
//
//    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//
//    }
//
//    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
//        return true
//    }
//}
