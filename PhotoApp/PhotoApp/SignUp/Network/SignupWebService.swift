//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by  Vladyslav Fil on 05.05.2023.
//

import Foundation

class SignupWebService {
    private var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func signup(
        withForm: SignupFormRequestModel,
        completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void
    ) {
        
    }
}
