//
//  DacteevMusic.swift
//
//  Copyright (c) 2016 Axel Etcheverry
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import Alamofire

public enum DacteevMusicError: ErrorType {
    case HttpClientIsNotSet
}

public class DacteevMusic {
    internal var base: String
    
    internal var version: String
    
    internal var http: Alamofire.Manager?
    
    public static let shared: DacteevMusic = {
        return DacteevMusic()
    }()
    
    init() {
        self.base = "https://api.dacteev.com"
        self.version = "v1"
        self.http = Alamofire.Manager.sharedInstance
    }
    
    public func getEndpoint(type: String)-> String {
        return self.base + "/" + self.version + type
    }
    
    public func setHttpClient(http: Alamofire.Manager) {
        self.http = http
    }
    
    public func setApiBaseUrl(url: String) {
        self.base = url
    }
    
    public func request(
        method: any,
        endpoint: String,
        parameters: any,
        completionHandler: (AnyObject?, ErrorType?) -> Void
        ) -> Void {
        guard let http = self.http else {
            //completionHandler(Response)
            
            completionHandler(nil, DacteevMusicError.HttpClientIsNotSet)
            return
        }
        
        http.request(method, self.getEndpoint(endpoint), parameters: parameters, encoding: .JSON)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    //if let JSON = response.result.value {
                    completionHandler(response.result.value, nil)
                //}
                case .Failure(let error):
                    //print(error)
                    completionHandler(response.result.value, error)
                }
        }
    }
    
    public func get(
        endpoint: String,
        parameters: any,
        completionHandler: (AnyObject?, ErrorType?) -> Void
        ) -> Void {
        self.request(.GET, endpoint, parameters, completionHandler)
    }
    
    public func post(
        endpoint: String,
        parameters: any,
        completionHandler: (AnyObject?, ErrorType?) -> Void
        ) -> Void {
        self.request(.POST, endpoint, parameters, completionHandler)
    }
}
