// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scheduleData = try? JSONDecoder().decode(ScheduleData.self, from: jsonData)

import Foundation

// MARK: - ScheduleData
struct ScheduleData: Codable {
    let search: Search
    let segments: [Segment]
    let intervalSegments: [JSONAny]
    let pagination: Pagination

    enum CodingKeys: String, CodingKey {
        case search, segments
        case intervalSegments = "interval_segments"
        case pagination
    }
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, limit, offset: Int
}

// MARK: - Search
struct Search: Codable {
    let from, to: SearchFrom
    let date: String
}

// MARK: - SearchFrom
struct SearchFrom: Codable {
    let type, title, shortTitle, popularTitle: String
    let code: String

    enum CodingKeys: String, CodingKey {
        case type, title
        case shortTitle = "short_title"
        case popularTitle = "popular_title"
        case code
    }
}

// MARK: - Segment
struct Segment: Codable {
    let thread: Thread
    let from, to: SegmentFrom
    let departurePlatform, arrivalPlatform: String
    let departureTerminal, arrivalTerminal: String?
    let stops: String
    let duration: Int
    let startDate: String
    let departure, arrival: Date
    let hasTransfers: Bool
    let ticketsInfo: TicketsInfo

    enum CodingKeys: String, CodingKey {
        case thread, from, to
        case departurePlatform = "departure_platform"
        case arrivalPlatform = "arrival_platform"
        case departureTerminal = "departure_terminal"
        case arrivalTerminal = "arrival_terminal"
        case stops, duration
        case startDate = "start_date"
        case departure, arrival
        case hasTransfers = "has_transfers"
        case ticketsInfo = "tickets_info"
    }
}

// MARK: - SegmentFrom
struct SegmentFrom: Codable {
    let type: StationTypeEnum
    let title: String
    let shortTitle: ShortTitle?
    let popularTitle: PopularTitle?
    let code: String
    let stationType: StationTypeEnum
    let stationTypeName: StationTypeName
    let transportType: TransportType

    enum CodingKeys: String, CodingKey {
        case type, title
        case shortTitle = "short_title"
        case popularTitle = "popular_title"
        case code
        case stationType = "station_type"
        case stationTypeName = "station_type_name"
        case transportType = "transport_type"
    }
}

enum PopularTitle: String, Codable {
    case empty = ""
    case автовокзалЦентральный = "Автовокзал Центральный"
    case казанскийВокзал = "Казанский вокзал"
}

enum ShortTitle: String, Codable {
    case empty = ""
    case мКазанская = "М-Казанская"
}

enum StationTypeEnum: String, Codable {
    case airport = "airport"
    case busStation = "bus_station"
    case station = "station"
    case trainStation = "train_station"
    case platform = "platform"
    case stop = "stop"
    case checkpoint = "checkpoint"
    case post = "post"
    case crossing = "crossing"
    case overtakingPoint = "overtaking_point"
    case busStop = "bus_stop"
    case unknown = "unknown"
    case port = "port"
    case portPoint = "port_point"
    case wharf = "wharf"
    case riverPort = "river_port"
    case marineStation = "marine_station"
}

enum StationTypeName: String, Codable {
    case автовокзал = "автовокзал"
    case аэропорт = "аэропорт"
    case вокзал = "вокзал"
    case станция = "станция"
    case автобуснаяОстановка = "автобусная остановка"
    case автостанция = "автостанция"
    case остановочныйПункт = "остановочный пункт"
    case разъезд = "разъезд"
}

//enum TransportType: String, Codable {
//    case bus = "bus"
//    case plane = "plane"
//    case train = "train"
//    case suburban = "suburban"
//    case water = "water"
//    case helicopter = "helicopter"
//}

// MARK: - Thread
struct Thread: Codable {
    let number, title, shortTitle: String
    let carrier: Carrier
    let vehicle: String?
    let expressType: JSONNull?
    let transportType: TransportType
    let transportSubtype: TransportSubtype
    let uid, threadMethodLink: String

    enum CodingKeys: String, CodingKey {
        case number, title
        case shortTitle = "short_title"
        case carrier, vehicle
        case expressType = "express_type"
        case transportType = "transport_type"
        case transportSubtype = "transport_subtype"
        case uid
        case threadMethodLink = "thread_method_link"
    }
}

// MARK: - Carrier
struct Carrier: Codable {
    let code: Int
    let title: String
    let codes: Codes
    let address: String?
    let url: String
    let email: String?
    let contacts, phone: String
    let logo: String?
    let logoSVG: String?

    enum CodingKeys: String, CodingKey {
        case code, title, codes, address, url, email, contacts, phone, logo
        case logoSVG = "logo_svg"
    }
}

// MARK: - Codes
struct Codes: Codable {
    let sirena, iata: String?
    let icao: JSONNull?
}

// MARK: - TransportSubtype
struct TransportSubtype: Codable {
    let title, code, color: JSONNull?
}

// MARK: - TicketsInfo
struct TicketsInfo: Codable {
    let etMarker: Bool
    let places: [Place]

    enum CodingKeys: String, CodingKey {
        case etMarker = "et_marker"
        case places
    }
}

// MARK: - Place
struct Place: Codable {
    let name: JSONNull?
    let price: Price
    let currency: String
}

// MARK: - Price
struct Price: Codable {
    let whole, cents: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
