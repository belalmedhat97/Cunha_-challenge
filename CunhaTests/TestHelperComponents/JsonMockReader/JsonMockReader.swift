//
//  JsonMockReader.swift
//  CunhaTests
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
class JsonReaderStub {
    static var shared: JsonReaderStub = JsonReaderStub()
    private init() {}
    func load<T:Codable>(file: String, model: T) -> T? {
       do {
        if let bundlePath = Bundle(for: type(of: self)).url(forResource: file, withExtension: "json")  {
            let data = try Data(contentsOf: bundlePath)
            let parsedLocalModel = try JSONDecoder().decode(T.self, from: data)
            return parsedLocalModel
            }
       } catch {
           print(error)
       }
        return nil
    }
}
