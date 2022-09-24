

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let AppSales = try AppSales(json)
// xxxx
// bbb
//zzz
//qqq
//rrrr
import Foundation
import Charts

// MARK: - AppSales
struct AppSales: Codable {
    var id = UUID()             //needed to make this work in a ForEach.
    let products: [AppSalesProduct]
    let months: [Month]

    enum CodingKeys: String, CodingKey {
        case products = "products"
        case months = "months"
    }
}

// MARK: AppSales convenience initializers and mutators

extension AppSales {
    init(data: Data) throws {
        self = try salesJSONDecoder().decode(AppSales.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        products: [AppSalesProduct]? = nil,
        months: [Month]? = nil
    ) -> AppSales {
        return AppSales(
            products: products ?? self.products,
            months: months ?? self.months
        )
    }

    func jsonData() throws -> Data {
        return try salesJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Month
struct Month: Codable,Identifiable {
    let month: String
    let monthAbbr: String
    let monthNum: String
    let product: [MonthProduct]
    var id = UUID()             //needed to make this work in a ForEach.

    enum CodingKeys: String, CodingKey {
        case month = "month"
        case monthAbbr = "monthAbbr"
        case monthNum = "monthNum"
        case product = "product"
    }
}

// MARK: Month convenience initializers and mutators

extension Month {
    init(data: Data) throws {
        self = try salesJSONDecoder().decode(Month.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        month: String? = nil,
        monthAbbr: String? = nil,
        monthNum: String? = nil,
        product: [MonthProduct]? = nil
    ) -> Month {
        return Month(
            month: month ?? self.month,
            monthAbbr: monthAbbr ?? self.monthAbbr,
            monthNum: monthNum ?? self.monthNum,
            product: product ?? self.product
        )
    }

    func jsonData() throws -> Data {
        return try salesJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - MonthProduct
struct MonthProduct: Codable {
    let title: Title
    let total: String
    let totalNA: String
    let totalGross: String
    let totalNet: String
    let updates: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case total = "total"
        case totalNA = "totalNA"
        case totalGross = "totalGross"
        case totalNet = "totalNet"
        case updates = "updates"
    }
}

// MARK: MonthProduct convenience initializers and mutators

extension MonthProduct {
    init(data: Data) throws {
        self = try salesJSONDecoder().decode(MonthProduct.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        title: Title? = nil,
        total: String? = nil,
        totalNA: String? = nil,
        totalGross: String? = nil,
        totalNet: String? = nil,
        updates: String? = nil
    ) -> MonthProduct {
        return MonthProduct(
            title: title ?? self.title,
            total: total ?? self.total,
            totalNA: totalNA ?? self.totalNA,
            totalGross: totalGross ?? self.totalGross,
            totalNet: totalNet ?? self.totalNet,
            updates: updates ?? self.updates
        )
    }

    func jsonData() throws -> Data {
        return try salesJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Title: String, Codable, Plottable{
    case apollo360 = "Apollo360"
    case distantSuns = "DistantSuns"
}

// MARK: - AppSalesProduct
struct AppSalesProduct: Codable {
    let name: String
    let price: String
    let sku: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
        case sku = "sku"
    }
}

// MARK: AppSalesProduct convenience initializers and mutators

extension AppSalesProduct {
    init(data: Data) throws {
        self = try salesJSONDecoder().decode(AppSalesProduct.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        price: String? = nil,
        sku: String? = nil
    ) -> AppSalesProduct {
        return AppSalesProduct(
            name: name ?? self.name,
            price: price ?? self.price,
            sku: sku ?? self.sku
        )
    }

    func jsonData() throws -> Data {
        return try salesJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func salesJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func salesJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

struct FirstLightSales
{
    var sales : AppSales?
    
    init(){
        do {
//            let path = Bundle.main.path(forResource: "FirstLightSales.json", ofType:nil)
            let path = Bundle.main.path(forResource: "FirstLightSalesWinter.json", ofType:nil)

            if  (path != nil){
                print("Got file: \(String(describing: path))")
            }
            
            let result = try String(contentsOfFile: path!, encoding: .utf8)
            
            sales=try AppSales(result)
            
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        //            Swift.print ("Other cases: Error: \(error.localizedDescription)") // I like all other colors
        //        }
    }
}
