// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let nearestStationsData = try? JSONDecoder().decode(NearestStationsData.self, from: jsonData)

import Foundation

// MARK: - NearestStationsData
struct NearestStationsData: Codable {
    let pagination: Pagination2
    let stations: [Station2]
}

// MARK: - Pagination
struct Pagination2: Codable {
    let total, limit, offset: Int
}

// MARK: - Station
struct Station2: Codable {
    let type: StationType
    let title: String
    let shortTitle: String?
    let popularTitle: PopularTitle?
    let code: String
    let lat, lng: Double
    let stationType: StationType
    let stationTypeName: StationTypeName
    let transportType: TransportType
    let distance: Double
    let majority: Int
    let typeChoices: TypeChoices

    enum CodingKeys: String, CodingKey {
        case type, title
        case shortTitle = "short_title"
        case popularTitle = "popular_title"
        case code, lat, lng
        case stationType = "station_type"
        case stationTypeName = "station_type_name"
        case transportType = "transport_type"
        case distance, majority
        case typeChoices = "type_choices"
    }
}

//enum PopularTitle: String, Codable {
//    case empty = ""
//    case автовокзалЦентральный = "Автовокзал Центральный"
//}

//enum StationType: String, Codable {
//    case airport = "airport"
//    case busStation = "bus_station"
//    case busStop = "bus_stop"
//    case crossing = "crossing"
//    case empty = ""
//    case station = "station"
//    case stop = "stop"
//}

//enum StationTypeName: String, Codable {
//    case автобуснаяОстановка = "автобусная остановка"
//    case автовокзал = "автовокзал"
//    case автостанция = "автостанция"
//    case аэропорт = "аэропорт"
//    case остановочныйПункт = "остановочный пункт"
//    case разъезд = "разъезд"
//    case станция = "станция"
//}

//enum TransportType2: String, Codable {
//    case bus = "bus"
//    case plane = "plane"
//    case train = "train"
//}

// MARK: - TypeChoices
struct TypeChoices: Codable {
    let schedule, tablo, train, suburban: Schedule?
}

// MARK: - Schedule
struct Schedule: Codable {
    let desktopURL, touchURL: String

    enum CodingKeys: String, CodingKey {
        case desktopURL = "desktop_url"
        case touchURL = "touch_url"
    }
}
