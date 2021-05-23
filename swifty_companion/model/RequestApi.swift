//
//  RequestApi.swift
//  swifty_companion
//
//  Created by Yvann Martorana on 27/04/2021.
//

import Foundation
import SwiftKeychainWrapper
import Alamofire

class RequestApi{

    struct TokenInfo:Codable{
        var application : [String:String]
        var created_at:Int
        var expires_in_seconds:Int
        var resource_owner_id:String?
        var scopes:[String]?
    }
    struct Token:Codable{
        let access_token : String?
        let token_type: String
        let expires_in: Int?
        let scope: String
        let created_at: Int
    }
    
    // MARK: - get Api credentials
    
    private static var UID: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "42-Info", ofType: "plist") else {
          fatalError("Couldn't find file '42-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "UID") as? String else {
          fatalError("Couldn't find key 'UID' in '42-Info.plist'.")
        }
        return value
      }
    }

    private static var Pwd: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "42-Info", ofType: "plist") else {
          fatalError("Couldn't find file '42-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "Pwd") as? String else {
          fatalError("Couldn't find key 'Pwd' in '42-Info.plist'.")
        }
        return value
      }
    }
    
    // MARK: - Request API get new token
    private static let apiToken = URL(string:"https://api.intra.42.fr/oauth/token")!
    
    static func refreshToken(callback: @escaping (Bool) -> Void){
        let body = ["grant_type":"client_credentials", "client_id":UID, "client_secret": Pwd]
        AF.request(apiToken, method:.post, parameters:body).validate().responseDecodable(of:Token.self){
            response in
            switch response.result{
            case .success(let data):
                let token:String? = data.access_token
                let _:Bool = KeychainWrapper.standard.set(token ?? "", forKey: "token")
                callback(true)
            case .failure(_):
                callback(false)
            }
        }
    }
    
    
    // MARK: - Get token from keychain + Bearer String Construct
    static func getToken() -> String?{
        let token = KeychainWrapper.standard.string(forKey: "token")
        if (token == nil){
            return nil
        }
        return "Bearer " + token!
    }
    
    // MARK: - Request API check if token is still available
    static func tokenIsAvailable(header: String, callback: @escaping (Bool) -> ()){
        let urltoken = URL(string:"https://api.intra.42.fr/oauth/token/info")!
        let headers:HTTPHeaders = ["Authorization" : header]
        AF.request(urltoken, headers: headers).validate().responseDecodable(of:TokenInfo.self){
            response in
            switch response.result{
            case .success(let data):
                if (data.expires_in_seconds > 0){
                callback(true)
                } else {
                    callback(false)
                }
            case .failure(_):
                callback(false)
            }
            
        }
    }
    
    // MARK: - Requests API search students
    static let apiStudent = "https://api.intra.42.fr/v2/users/"
    
    static func getStudent(name: String, callback: @escaping (Bool, Student?) -> Void) {
        let studentUrl = URL(string: apiStudent + name)!
        getAvailableHeader{(success, headers) in
            let header:HTTPHeaders = ["Authorization" : headers!]
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            AF.request(studentUrl, headers: header).validate().responseDecodable(of:APIStudent.self, decoder:decoder){
                response in
                switch response.result{
                case .success(let data):
                    let student:Student = data.toAppModel()
                    callback(true, student)
                case .failure(_):
                    callback(false, nil)
                }
                
            }
        }
    }
    
    
    
    
    // MARK: - Check and Return Authorization header with available token
    static func getAvailableHeader(callback: @escaping (Bool, String?) -> Void){
        var token:String?
        if let header = getToken() {
            tokenIsAvailable(header: header){(success) in
                if (success){
                    token = header
                    callback(true, token)
                } else {
                    refreshToken(){(success) in
                        let newHeader = getToken()
                        token = newHeader!
                        callback(true, token)
                    }
                }
            }
        } else {
            refreshToken(){(success) in
                let newHeader = getToken()
                token = newHeader!
                callback(true, token)
            }
        }
    }
    
}

