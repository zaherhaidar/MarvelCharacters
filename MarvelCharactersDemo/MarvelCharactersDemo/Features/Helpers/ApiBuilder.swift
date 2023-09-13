//
//  ApiBuilder.swift
//  MarvelCharactersDemo
//
//  Created by zaher haidar on 12/09/2023.
//

import CommonCrypto
import Foundation

class ApiBuilder {
    static var BASE_URL = "https://gateway.marvel.com:443/v1/public/"

    static func buildServiceRequestUrl(endPoint: String, params: [String: String]? = nil) -> URL? {
        let baseUrl = "\(BASE_URL)\(endPoint)"
        if var urlComponents = URLComponents(string: baseUrl) {
            let publicKey = "a313080c6ee0b7708af68c998c575ac9"
            let privateKey = "c5d351b9860c2333c21669fb5872cf54745f94ec"
            let privateKeyMd5 = generateMarvelAPIHash(publicKey: publicKey, privateKey: privateKey)

            // addd auth params
            var requestParams = params ?? [String: String]()
            requestParams["ts"] = privateKeyMd5.ts
            requestParams["apikey"] = publicKey
            requestParams["hash"] = privateKeyMd5.hash

            // build query string
            var queryItems = [URLQueryItem]()
            for (key, value) in requestParams {
                queryItems.append(URLQueryItem(name: key, value: value))
            }

            urlComponents.queryItems = queryItems

            if let urlAbsoluteString = urlComponents.url?.absoluteString {
                return URL(string: urlAbsoluteString)
            }
        }

        return nil
    }

    private static func generateMarvelAPIHash(publicKey: String, privateKey: String) -> (ts: String, hash: String) {
        // Get the current timestamp (you can use other long strings if needed)
        let ts = String(Int(Date().timeIntervalSince1970))

        // Concatenate the timestamp, private key, and public key
        let dataToHash = ts + privateKey + publicKey

        // Calculate the MD5 hash
        let hash = MD5(dataToHash)

        return (ts: ts, hash: hash)
    }

    private static func MD5(_ string: String) -> String {
        if let messageData = string.data(using: .utf8) {
            var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            _ = messageData.withUnsafeBytes { bytes in
                CC_MD5(bytes.baseAddress, CC_LONG(messageData.count), &digest)
            }

            var md5String = ""
            for byte in digest {
                md5String += String(format: "%02x", byte)
            }

            return md5String
        }
        return ""
    }
}
