// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let stationsData = try? JSONDecoder().decode(StationsData.self, from: jsonData)

import Foundation

// MARK: - StationsData
struct StationsData: Codable {
    let countries: [Country]
}

// MARK: - Country
struct Country: Codable {
    let regions: [Region]
    let codes: CountryCodes
    let title: String
}

// MARK: - CountryCodes
struct CountryCodes: Codable {
    let yandexCode: String?

    enum CodingKeys: String, CodingKey {
        case yandexCode = "yandex_code"
    }
}

// MARK: - Region
struct Region: Codable {
    let settlements: [Settlement]
    let codes: CountryCodes
    let title: String
}

// MARK: - Settlement
struct Settlement: Codable {
    let title: String
    let codes: CountryCodes
    let stations: [Station]
}

// MARK: - Station
struct Station: Codable {
    let direction: Direction
    let codes: StationCodes
    let stationType: StationType
    let title: String
    let longitude: Itude
    let transportType: TransportType
    let latitude: Itude

    enum CodingKeys: String, CodingKey {
        case direction, codes
        case stationType = "station_type"
        case title, longitude
        case transportType = "transport_type"
        case latitude
    }
}

// MARK: - StationCodes
struct StationCodes: Codable {
    let yandexCode: String
    let esrCode: String?

    enum CodingKeys: String, CodingKey {
        case yandexCode = "yandex_code"
        case esrCode = "esr_code"
    }
}

enum Direction: String, Codable {
    case empty = ""
    case абхазское = "Абхазское"
    case акадырское = "Акадырское"
    case аксарайское = "Аксарайское"
    case алапаевскаяУЖД = "Алапаевская УЖД"
    case алапаевское = "Алапаевское"
    case алатырское = "Алатырское"
    case алейское = "Алейское"
    case александровское = "Александровское"
    case алексинское = "Алексинское"
    case алнашинское = "Алнашинское"
    case араратское = "Араратское"
    case арзамасское = "Арзамасское"
    case армавирское = "Армавирское"
    case арское = "Арское"
    case архангельское = "Архангельское"
    case асиновское = "Асиновское"
    case астанинское = "Астанинское"
    case атбасарское = "Атбасарское"
    case аткарское = "Аткарское"
    case багратионовское = "Багратионовское"
    case балашовское = "Балашовское"
    case балезинское = "Балезинское"
    case балтийское = "Балтийское"
    case балтийскоеИВаршавское = "Балтийское и Варшавское"
    case барановичское = "Барановичское"
    case батайское = "Батайское"
    case белгородское = "Белгородское"
    case белоглинское = "Белоглинское"
    case белогорскБлаговещенск = "Белогорск-Благовещенск"
    case белогорскСковородино = "Белогорск-Сковородино"
    case белогорскХабаровск = "Белогорск-Хабаровск"
    case беломорское = "Беломорское"
    case белорецкое = "Белорецкое"
    case белореченское = "Белореченское"
    case белорусское = "Белорусское"
    case белостокское = "Белостокское"
    case бийское = "Бийское"
    case биробиджанское = "Биробиджанское"
    case богдановичское = "Богдановичское"
    case богоявленское = "Богоявленское"
    case бологовское = "Бологовское"
    case борисовское = "Борисовское"
    case братское = "Братское"
    case брестское = "Брестское"
    case брянскийУзел = "Брянский узел"
    case брянское = "Брянское"
    case бугульминское = "Бугульминское"
    case бузулукское = "Бузулукское"
    case буйское = "Буйское"
    case валдайское = "Валдайское"
    case валуйкинское = "Валуйкинское"
    case великолукское = "Великолукское"
    case вельское = "Вельское"
    case верхнеуфалейское = "Верхнеуфалейское"
    case верхотурское = "Верхотурское"
    case вильнюсское = "Вильнюсское"
    case витебское = "Витебское"
    case влодавское = "Влодавское"
    case волгоградское = "Волгоградское"
    case волковыское = "Волковыское"
    case вологодское = "Вологодское"
    case волоколамское = "Волоколамское"
    case волховстроевское = "Волховстроевское"
    case воронежское = "Воронежское"
    case восточное = "Восточное"
    case воткинское = "Воткинское"
    case выборгское = "Выборгское"
    case высокоЛитовское = "Высоко-Литовское"
    case вяземское = "Вяземское"
    case вязниковское = "Вязниковское"
    case галичское = "Галичское"
    case глазовское = "Глазовское"
    case глушковское = "Глушковское"
    case гомельскийУзел = "Гомельский узел"
    case гомельское = "Гомельское"
    case горловское = "Горловское"
    case горнозаводское = "Горнозаводское"
    case городскаяЭлектричка = "Городская электричка"
    case горьковское = "Горьковское"
    case готнянское = "Готнянское"
    case гродненское = "Гродненское"
    case грязинское = "Грязинское"
    case губкинское = "Губкинское"
    case гудермесское = "Гудермесское"
    case гюмрийское = "Гюмрийское"
    case даниловское = "Даниловское"
    case даугавпилское = "Даугавпилское"
    case дебальцевское = "Дебальцевское"
    case дербентское = "Дербентское"
    case джанкойское = "Джанкойское"
    case димитровградское = "Димитровградское"
    case дновское = "Дновское"
    case дружининское = "Дружининское"
    case дятьковское = "Дятьковское"
    case евпаторийское = "Евпаторийское"
    case егоршинское = "Егоршинское"
    case ейское = "Ейское"
    case екатеринбургское = "Екатеринбургское"
    case елецкое = "Елецкое"
    case енакиевское = "Енакиевское"
    case ефремовское = "Ефремовское"
    case железногорское = "Железногорское"
    case жлобинское = "Жлобинское"
    case заволжское = "Заволжское"
    case западное = "Западное"
    case заринское = "Заринское"
    case зеленоградское = "Зеленоградское"
    case зеленодольское = "Зеленодольское"
    case златоустовское = "Златоустовское"
    case ивдельское = "Ивдельское"
    case ижевское = "Ижевское"
    case илецкое = "Илецкое"
    case иловайское = "Иловайское"
    case инзенское = "Инзенское"
    case интинское = "Интинское"
    case ираёльское = "Ираёльское"
    case иркутское = "Иркутское"
    case иртышское = "Иртышское"
    case исилькульское = "Исилькульское"
    case кавказское = "Кавказское"
    case казанское = "Казанское"
    case калинковичское = "Калинковичское"
    case калязинское = "Калязинское"
    case каменскУральское = "Каменск-Уральское"
    case кандалакшинское = "Кандалакшинское"
    case карагандинское = "Карагандинское"
    case карламанское = "Карламанское"
    case карпогорское = "Карпогорское"
    case карталинское = "Карталинское"
    case карымское = "Карымское"
    case касторненское = "Касторненское"
    case кемское = "Кемское"
    case киевское = "Киевское"
    case кинешемское = "Кинешемское"
    case кировское = "Кировское"
    case кирсановское = "Кирсановское"
    case кисловодское = "Кисловодское"
    case ковельское = "Ковельское"
    case ковровское = "Ковровское"
    case ковылкинское = "Ковылкинское"
    case кокчетавское = "Кокчетавское"
    case кольцевое = "Кольцевое"
    case коношское = "Коношское"
    case коростенское = "Коростенское"
    case костромское = "Костромское"
    case котельничское = "Котельничское"
    case котласское = "Котласское"
    case краснодарское = "Краснодарское"
    case краснополянское = "Краснополянское"
    case красноуфимское = "Красноуфимское"
    case красноярское = "Красноярское"
    case кричевское = "Кричевское"
    case кропоткинское = "Кропоткинское"
    case кузбасскоеИЖеребцовское = "Кузбасское и Жеребцовское"
    case кузнецкое = "Кузнецкое"
    case кулундинское = "Кулундинское"
    case купянское = "Купянское"
    case курганское = "Курганское"
    case курское = "Курское"
    case кыновское = "Кыновское"
    case ладожскоеИриновское = "Ладожское (Ириновское)"
    case левтолстовское = "Левтолстовское"
    case ленинградское = "Ленинградское"
    case ленское = "Ленское"
    case лепельское = "Лепельское"
    case лидское = "Лидское"
    case липецкое = "Липецкое"
    case лискинское = "Лискинское"
    case лиховское = "Лиховское"
    case луганское = "Луганское"
    case лужское = "Лужское"
    case лунинецкое = "Лунинецкое"
    case льговское = "Льговское"
    case магнитогорское = "Магнитогорское"
    case майкопское = "Майкопское"
    case маловишерское = "Маловишерское"
    case мамоновское = "Мамоновское"
    case мариинское = "Мариинское"
    case медвежьегорское = "Медвежьегорское"
    case междуреченское = "Междуреченское"
    case минское = "Минское"
    case мичуринское = "Мичуринское"
    case могилёвское = "Могилёвское"
    case молодечненское = "Молодечненское"
    case монзенскаяЖД = "Монзенская ЖД"
    case моршанское = "Моршанское"
    case московскийМонорельс = "Московский монорельс"
    case московское = "Московское"
    case мурманское = "Мурманское"
    case мцд1 = "МЦД-1"
    case мцд2 = "МЦД-2"
    case мцд3 = "МЦД-3"
    case мцд4 = "МЦД-4"
    case мцкМосковскоеЦентральноеКольцо = "МЦК: Московское центральное кольцо"
    case навлинское = "Навлинское"
    case называевское = "Называевское"
    case невельское = "Невельское"
    case невинномысское = "Невинномысское"
    case нерехтское = "Нерехтское"
    case нижнетагильское = "Нижнетагильское"
    case новозыбковское = "Новозыбковское"
    case новолисинское = "Новолисинское"
    case новомосковское = "Новомосковское"
    case новороссийское = "Новороссийское"
    case новосибирское = "Новосибирское"
    case новосокольническое = "Новосокольническое"
    case няндомское = "Няндомское"
    case обозерское = "Обозерское"
    case ожерельевское = "Ожерельевское"
    case олейниковское = "Олейниковское"
    case оленегорское = "Оленегорское"
    case оренбургское = "Оренбургское"
    case орловское = "Орловское"
    case орское = "Орское"
    case оршанское = "Оршанское"
    case осиповичское = "Осиповичское"
    case осташковское = "Осташковское"
    case павелецкое = "Павелецкое"
    case павлодарское = "Павлодарское"
    case партизанское = "Партизанское"
    case пензенское = "Пензенское"
    case пермское = "Пермское"
    case пестовское = "Пестовское"
    case петровальское = "Петровальское"
    case петропавловское = "Петропавловское"
    case печорское = "Печорское"
    case пинское = "Пинское"
    case поворинское = "Поворинское"
    case полоцкое = "Полоцкое"
    case поронайское = "Поронайское"
    case похвистневское = "Похвистневское"
    case приозерское = "Приозерское"
    case прокопьевское = "Прокопьевское"
    case пугачёвское = "Пугачёвское"
    case пыталовское = "Пыталовское"
    case разданское = "Разданское"
    case ржевское = "Ржевское"
    case рижское = "Рижское"
    case рославльское = "Рославльское"
    case россошанское = "Россошанское"
    case ростовское = "Ростовское"
    case ртищевское = "Ртищевское"
    case рудное = "Рудное"
    case рузаевское = "Рузаевское"
    case рыбинское = "Рыбинское"
    case ряжскоАлексинское = "Ряжско-Алексинское"
    case ряжское = "Ряжское"
    case савёловское = "Савёловское"
    case самарское = "Самарское"
    case саранское = "Саранское"
    case саратовское = "Саратовское"
    case сарептинское = "Сарептинское"
    case сасовское = "Сасовское"
    case саянское = "Саянское"
    case светлогорское = "Светлогорское"
    case свирское = "Свирское"
    case севастопольское = "Севастопольское"
    case северное = "Северное"
    case северодвинское = "Северодвинское"
    case сенное = "Сенное"
    case сергачское = "Сергачское"
    case сибайское = "Сибайское"
    case сковородиноБелогорск = "Сковородино-Белогорск"
    case сковородиноМогоча = "Сковородино-Могоча"
    case сковородиноТында = "Сковородино-Тында"
    case слуцкое = "Слуцкое"
    case смоленское = "Смоленское"
    case советское = "Советское"
    case соликамское = "Соликамское"
    case сонковское = "Сонковское"
    case сосьвинское = "Сосьвинское"
    case спасДеменское = "Спас-Деменское"
    case ставропольское = "Ставропольское"
    case старооскольское = "Старооскольское"
    case сумгаитское = "Сумгаитское"
    case сумское = "Сумское"
    case суровикинское = "Суровикинское"
    case сухиничское = "Сухиничское"
    case сызранское = "Сызранское"
    case сыктывкарское = "Сыктывкарское"
    case тавдинское = "Тавдинское"
    case таганрогское = "Таганрогское"
    case тайгинское = "Тайгинское"
    case тайшетское = "Тайшетское"
    case тамбовское = "Тамбовское"
    case татарское = "Татарское"
    case таштагольское = "Таштагольское"
    case тверское = "Тверское"
    case тереховское = "Тереховское"
    case тимашевское = "Тимашевское"
    case тихорецкое = "Тихорецкое"
    case тобольское = "Тобольское"
    case тольяттинское = "Тольяттинское"
    case томское = "Томское"
    case топкинское = "Топкинское"
    case торезское = "Торезское"
    case торжокское = "Торжокское"
    case торопецкое = "Торопецкое"
    case троицкоПечорское = "Троицко-Печорское"
    case троицкое = "Троицкое"
    case туапсинское = "Туапсинское"
    case тульское = "Тульское"
    case тумское = "Тумское"
    case тындаНовыйУргал = "Тында-Новый Ургал"
    case тындаСковородино = "Тында-Сковородино"
    case тындаХани = "Тында-Хани"
    case тюменское = "Тюменское"
    case удорское = "Удорское"
    case удрицкое = "Удрицкое"
    case уждКаринторф = "УЖД Каринторф"
    case уланУдинское = "Улан-Удинское"
    case унечское = "Унечское"
    case уссурийское = "Уссурийское"
    case харьковское = "Харьковское"
    case хасавюртовское = "Хасавюртовское"
    case хилокское = "Хилокское"
    case холмское = "Холмское"
    case цильнинское = "Цильнинское"
    case чебоксарское = "Чебоксарское"
    case челябинское = "Челябинское"
    case череповецкое = "Череповецкое"
    case черниговское = "Черниговское"
    case черноморское = "Черноморское"
    case чернышевскАмазар = "Чернышевск-Амазар"
    case чернышевскБукачача = "Чернышевск-Букачача"
    case чернышевскЧита = "Чернышевск-Чита"
    case черняховское = "Черняховское"
    case читинское = "Читинское"
    case чудовское = "Чудовское"
    case шарьинское = "Шарьинское"
    case южноСахалинское = "Южно-Сахалинское"
    case южное = "Южное"
    case юргинское = "Юргинское"
    case юрьевПольское = "Юрьев-Польское"
    case яранское = "Яранское"
    case ярославское = "Ярославское"
}

enum Itude: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Itude.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Itude"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum StationType: String, Codable {
    case airport = "airport"
    case busStation = "bus_station"
    case busStop = "bus_stop"
    case checkpoint = "checkpoint"
    case crossing = "crossing"
    case empty = ""
    case marineStation = "marine_station"
    case overtakingPoint = "overtaking_point"
    case platform = "platform"
    case port = "port"
    case portPoint = "port_point"
    case post = "post"
    case riverPort = "river_port"
    case station = "station"
    case stop = "stop"
    case trainStation = "train_station"
    case unknown = "unknown"
    case wharf = "wharf"
}

enum TransportType: String, Codable {
    case bus = "bus"
    case helicopter = "helicopter"
    case plane = "plane"
    case sea = "sea"
    case train = "train"
    case water = "water"
}
