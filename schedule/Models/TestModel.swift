////
////  TestModel.swift
////  schedule
////
////  Created by Флоранс on 09.12.2023.
////
//
//import Foundation
//
//struct Test1: Decodable {
////    let st: String
////    let search: Search
////    let segments: [Segment]
////    let intervalSegments: [Any] // You can replace `Any` with the actual type if needed
////    let pagination: Pagination
//}
//
////
//struct Search: Codable {
////    let from: Station
////    let to: Station
////    let date: String
////}
////
////struct Station: Codable {
////    let type: String
////    let title: String
////    let shortTitle: String?
////    let popularTitle: String?
////    let code: String
////    let stationType: String
////    let stationTypeName: String
////    let transportType: String
////}
////
////struct Segment: Codable {
////    let thread: Thread
////    let from: Station
////    let to: Station
////    let departurePlatform: String
////    let arrivalPlatform: String
////    let departureTerminal: String
////    let arrivalTerminal: String
////    let stops: String
////    let duration: Double
////    let startDate: String
////    let departure: String
////    let arrival: String
////    let hasTransfers: Bool
////    let ticketsInfo: TicketsInfo
////}
////
////struct Thread: Codable {
////    let number: String
////    let title: String
////    let shortTitle: String
////    let carrier: Carrier
////    let vehicle: String
////    let expressType: String?
////    let transportType: String
////    let transportSubtype: TransportSubtype?
////    let uid: String
////    let threadMethodLink: String
////}
////
////struct Carrier: Codable {
////    let code: Int
////    let title: String
////    let codes: Codes
////    let address: String
////    let url: String
////    let email: String
////    let contacts: String
////    let phone: String
////    let logo: String?
////    let logoSvg: String
////}
////
////struct Codes: Codable {
////    let sirena: String?
////    let iata: String
////    let icao: String?
////}
////
////struct TransportSubtype: Codable {
////    let title: String?
////    let code: String?
////    let color: String?
////}
////
////struct TicketsInfo: Codable {
////    let etMarker: Bool
////    let places: [Any] // You can replace `Any` with the actual type if needed
////}
////
////struct Pagination: Codable {
////    let total: Int
////    let limit: Int
////    let offset: Int
////}
