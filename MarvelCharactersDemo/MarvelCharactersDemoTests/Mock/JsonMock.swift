//
//  JsonMock.swift
//  MarvelCharactersDemoTests
//
//  Created by zaher haidar on 15/09/2023.
//

import Foundation

enum JsonError: Error {
    case load, parse (String)
}

class JsonMock {

    let name: String
    var json: [String: Any]?
    var jsonResponse: [String: Any]?

    init(_ name: String) throws {
        self.name = name
        json = try loadJson()
        jsonResponse = json
    }

    func loadJson() throws -> [String: Any]? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw JsonError.load
        }

        do {
            let data = try Data(contentsOf: url)
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
        } catch let error {
            throw JsonError.parse("json parse error: \(error.localizedDescription)")
        }
    }
}
