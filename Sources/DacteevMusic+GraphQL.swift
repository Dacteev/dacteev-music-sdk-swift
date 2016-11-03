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

extension DacteevMusic {
    internal var graphql: String = "/graphql"
    
    private func encode(value: AnyObject) -> String {
        let options = NSJSONWritingOptions()
        let data = try! NSJSONSerialization.dataWithJSONObject(value, options: options)
        
        
        return String(data: data, encoding: NSUTF8StringEncoding)!
    }
    
    public func query(
        query: String,
        variables: [String: AnyObject]? = nil,
        completionHandler: (AnyObject?, ErrorType?) -> Void
    ) -> Void {
        var params: [String: AnyObject] = [
            "query": query
        ];
        
        if (variables != nil) {
            params["variables"] = self.encode(variables!)
        }
        
        self.post(self.graphql, parameters: params, completionHandler)
    }
    
    public func mutate(
        query: String,
        variables: [String: AnyObject]? = nil,
        completionHandler: (AnyObject?, ErrorType?) -> Void
        ) -> Void {
        var params: [String: AnyObject] = [
            "query": query
        ];
        
        if (variables != nil) {
            params["variables"] = self.encode(variables!)
        }
        
        self.post(self.graphql, parameters: params, completionHandler)
    }
}
