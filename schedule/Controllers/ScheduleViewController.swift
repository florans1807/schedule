//
//  ViewController.swift
//  schedule
//
//  Created by Флоранс on 04.12.2023.
//

import UIKit

class ScheduleViewController: UIViewController, SetSelectedDirectionOrDate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var dateStackView: UIStackView!
    @IBOutlet weak var wayView: UIView!
    @IBOutlet weak var transportsStackView: UIStackView!
    
    @IBOutlet weak var todayBtn: UIButton!
    @IBOutlet weak var tomorrowBtn: UIButton!
    @IBOutlet weak var dateBtn: UIButton!
    
    @IBOutlet weak var anyTransportBtn: UIButton!
    @IBOutlet weak var planeBtn: UIButton!
    @IBOutlet weak var trainBtn: UIButton!
    @IBOutlet weak var suburbanBtn: UIButton!
    @IBOutlet weak var busBtn: UIButton!
    
    private var transportType: String?
    private var selectedDirection: String?
    private var stationCodeFrom: String?
    private var stationCodeTo: String?
    private var selectedDate: String?
    private var chosenDate: Date?
    
    private var scheduleData: ScheduleData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        fromTextField.borderStyle = .none
        toTextField.borderStyle = .none
        
        fromTextField.delegate = self
        toTextField.delegate = self
        
        wayView.layer.masksToBounds = true
        wayView.layer.cornerRadius = 4
        wayView.layer.borderWidth = 1.0
        wayView.layer.borderColor = UIColor.systemGray4.cgColor
        
        todayBtn.layer.masksToBounds = true
        dateBtn.layer.masksToBounds = true
        todayBtn.round(corners: [.bottomLeft, .topLeft], radius: 4)
        dateBtn.round(corners: [.bottomRight, .topRight], radius: 4)
        
        //setting conditions by default
        selectedDate = formatDate(date: Date.today)
        transportType = ""
        buttonSelectOrDeselect(buttons: [todayBtn, anyTransportBtn], isChosen: true)
        //todayBtn.setTitleColor(.white, for: .normal)
        //anyTransportBtn.backgroundColor = .darkGray
        //anyTransportBtn.setTitleColor(.white, for: .normal)
        
        //let vc = CitiesViewController()
        //vc.getAllStations()
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: date)
    }
    
    func setDirection(direction: String, code: String?, isFrom: Bool) {
        selectedDirection = direction
        if isFrom  {
            stationCodeFrom = code
        } else {
            stationCodeTo = code
        }
    
        if isFrom {
            fromTextField.text = direction
            fromTextField.resignFirstResponder()
        } else {
            toTextField.text = direction
            fromTextField.resignFirstResponder()
        }
    }
    
    func setSelectedDate(strDate: String) {
        selectedDate = strDate
        fromTextField.resignFirstResponder()
        toTextField.resignFirstResponder()
                
        switch strDate {
        case "today":
            dateBtn.setTitle("Дата", for: .normal)
            todayBtn.backgroundColor = .darkGray
            todayBtn.setTitleColor(.white, for: .normal)
            chosenDate = Date.today
        case "tomorrow":
            dateBtn.setTitle("Дата", for: .normal)
            tomorrowBtn.backgroundColor = .darkGray
            tomorrowBtn.setTitleColor(.white, for: .normal)
            chosenDate = Date.tomorrow
        case "На все дни":
            dateBtn.setTitle(strDate, for: .normal)
            buttonSelectOrDeselect(buttons: [dateBtn], isChosen: true)
            buttonSelectOrDeselect(buttons: [todayBtn, tomorrowBtn], isChosen: false)
        default:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: strDate)
            
            dateFormatter.locale = Locale(identifier: "ru_RU")
            dateFormatter.dateFormat = "d MMMM"
            let dateString = dateFormatter.string(from: date!)
            
            dateBtn.setTitle(dateString, for: .normal)
            buttonSelectOrDeselect(buttons: [dateBtn], isChosen: true)
            buttonSelectOrDeselect(buttons: [todayBtn, tomorrowBtn], isChosen: false)
            chosenDate = date
        }
    }
    
    func buttonSelectOrDeselect(buttons: [UIButton], isChosen: Bool) {
        for btn in buttons {
            if isChosen {
                btn.backgroundColor = .darkGray
                btn.setTitleColor(.white, for: .normal)
                btn.tintColor = .white
            } else {
                btn.backgroundColor = .systemGray4
                btn.setTitleColor(.black, for: .normal)
                btn.tintColor = .black
            }
        }
    }
    
    func resignTextFields() {
        fromTextField.resignFirstResponder()
        toTextField.resignFirstResponder()
    }
    
    @IBAction func selectDate(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            selectedDate = formatDate(date: Date.today)
            chosenDate = Date.today
            dateBtn.setTitle("Дата", for: .normal)
            buttonSelectOrDeselect(buttons: [todayBtn], isChosen: true)
            buttonSelectOrDeselect(buttons: [tomorrowBtn, dateBtn], isChosen: false)
        case 2:
            selectedDate = formatDate(date: Date.tomorrow)
            chosenDate = Date.tomorrow
            dateBtn.setTitle("Дата", for: .normal)
            buttonSelectOrDeselect(buttons: [tomorrowBtn], isChosen: true)
            buttonSelectOrDeselect(buttons: [todayBtn, dateBtn], isChosen: false)
        case 3:
            selectedDate = ""
            let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
            
            guard let calendarVC = storyboard.instantiateViewController(identifier: "CalendarPopover") as? CalendarViewController else {
                print("Something wrong in storyboard")
                return
            }
            calendarVC.modalPresentationStyle = .popover
            calendarVC.delegate = self
            calendarVC.selectedDate = chosenDate
            
            present(calendarVC, animated: true, completion: nil)
        default:
            break
        }
                
//        for btn in dateStackView.arrangedSubviews {
//            let button = btn //as! UIButton
//            if btn.tag == sender.tag && btn.tag != 3 {
//                button.backgroundColor = .darkGray
//                //button.setTitleColor(.white, for: .normal)
//                button.tintColor = .white
//            } else if sender.tag != 3 {
//                button.backgroundColor = .systemGray4
//                //button.setTitleColor(.black, for: .normal)
//                button.tintColor = .black
//            }
//        }
    }
    
    @IBAction func selectTransport(_ sender: UIButton) {
        
        for btn in transportsStackView.arrangedSubviews {
            let button = btn as! UIButton
            if btn.tag == sender.tag {
                //button.backgroundColor = .darkGray
                button.setTitleColor(.white, for: .normal)
                button.tintColor = .white
            } else {
                button.backgroundColor = .systemGray4
                button.setTitleColor(.black, for: .normal)
                button.tintColor = .black
            }
        }
        
        switch sender.tag {
        case 1:
            sender.backgroundColor = .darkGray
            transportType = ""
        case 2:
            sender.backgroundColor = .blue
            transportType = "plane"
        case 3:
            sender.backgroundColor = .red
            transportType = "train"
        case 4:
            sender.backgroundColor = .green
            transportType = "suburban"
        case 5:
            sender.backgroundColor = .orange
            transportType = "bus"
        default:
            break
        }
    }
    
    @IBAction func tapToFindSchedule(_ sender: Any) {
        if let from = fromTextField.text, let to = toTextField.text {
            if false {//from.isEmpty || to.isEmpty {
                showAlertMessage()
            } else {
                ApiClient.shared.getSchedule(date: selectedDate ?? "", transport: transportType ?? "", from: stationCodeFrom ?? "", to: stationCodeTo ?? "") { [weak self] values in
                    DispatchQueue.main.async {
                        guard let self else { return }
                        self.scheduleData = values
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    @IBAction func changeDirections(_ sender: Any) {
        let from = fromTextField.text
        let to = toTextField.text
        fromTextField.text = to
        toTextField.text = from
    }
    
    func showAlertMessage() {
        let alert = UIAlertController(title: "Выберите направление", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("ok")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if scheduleData != nil {
            return (scheduleData?.segments.count)!
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = scheduleData?.segments[indexPath.row].arrivalPlatform
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
        
//        ApiClient.shared.getAllStations { values in
//            DispatchQueue.main.async {
//                //guard let self else { return }
//                cityVC.countries = values
//                cityVC.getListOfStations()
//                cityVC.tableView.reloadData()
//            }
//        }
        
        present(cityVC, animated: true, completion: nil)
    }
}

protocol SetSelectedDirectionOrDate {
    func setDirection(direction: String, code: String?, isFrom: Bool)
    func setSelectedDate(strDate: String)
    func resignTextFields()
}
