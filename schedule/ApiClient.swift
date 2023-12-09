//
//  ApiClient.swift
//  schedule
//
//  Created by Флоранс on 05.12.2023.
//

import Foundation
import UIKit
import CoreLocation

//protocol ApiClient {
//    func getSchedule(completion: @escaping)
//}

class ApiClient {
    
    static let shared = ApiClient()
    
    //расписание рейсов
    let urlString = "https://api.rasp.yandex.net/v3.0/search/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&format=json"
    
    let urlString1 = "https://api.rasp.yandex.net/v3.0/search/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&format=json&from=c45&to=c213&lang=ru_RU&page=1&date=2023-12-09"
    
    //список всех доступных станций
    let urlString2 = "https://api.rasp.yandex.net/v3.0/stations_list/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&lang=ru_RU&format=json"
    
    //список ближайших станций
    let urlString3 = "https://api.rasp.yandex.net/v3.0/nearest_stations/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&format=json"//&lat=50.440046&lng=40.4882367&distance=50&lang=ru_RU"
    
    lazy var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.distanceFilter = 10
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    
    func getSchedule(date: String = "", transport: String = "", from: String, to: String, completion: @escaping (ScheduleData) -> Void) {
        let when = (date == "На все дни") ? "" : "&date=\(date)"
        let transfer = transport.isEmpty ? "" : "&transport_types=\(transport)"
        let url1 = URL(string: urlString + "&from=\(from)&to=\(to)&lang=ru_RU&page=1&date=\(date)&transport_types=\(transport)")!
        let url2 = URL(string: "https://api.rasp.yandex.net/v3.0/search/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&format=json&from=\(from)&to=\(to)&lang=ru_RU&page=1" + when + transfer)!
        let url3 = URL(string:"https://api.rasp.yandex.net/v3.0/search/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&format=json&from=c45&to=c213&lang=ru_RU&page=1" + when + transfer)!
        let url4 = URL(string:"https://api.rasp.yandex.net/v3.0/search/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&format=json&from=\(from)&to=\(to)&lang=ru_RU&page=1" + transfer)!
        
        let url5 = URL(string:"https://api.rasp.yandex.net/v3.0/search/?apikey=c1c3c337-25ac-43e7-96d8-b4b906744736&format=json&from=s9623358&to=s9623597&lang=ru_RU&page=1" + transfer)!
        
        var request = URLRequest(url: url4)
        print(url5)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                
                if let scheduleData = try? decoder.decode(ScheduleData.self, from: data) {
                    print(scheduleData)
                    completion(scheduleData)
                } else {
                    print("fail")
                }
                
                let scheduleData = try decoder.decode(ScheduleData.self, from: data)
                completion(scheduleData)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
//    func getNearestStations(completion: @escaping ([Station2]) -> Void) {
//        locationManager.requestWhenInUseAuthorization()
//        let location = locationManager.location ?? CLLocation()
//        
//        let url = URL(string: urlString3 + "&lat=\(location.coordinate.latitude)&lng=\(location.coordinate.longitude)&distance=50&lang=ru_RU")!
//        var request = URLRequest(url: url)
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data else {
//                return
//            }
//            
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .iso8601
//
//            if let stationsData = try? decoder.decode(NearestStationsData.self, from: data) {
//                print("success2")
//                completion(stationsData.stations)
//            } else {
//                print("fail")
//            }
//        }
//        task.resume()
//    }
    
    func getAllStations(date: String = "", transport: String = "", completion: @escaping ([Country]) -> Void) {
        let url = URL(string: urlString2)!
        var request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let stationsData = try? decoder.decode(StationsData.self, from: data) {
                print("success3")
                completion(stationsData.countries)
            } else {
                print("failToDecode")
            }
        }
        task.resume()
    }
}
