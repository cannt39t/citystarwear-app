//
//  RestAuthenticationService.swift
//  CitystarwearApp
//
//  Created by Илья Казначеев on 06.03.2023.
//

import Foundation
import Alamofire

enum hdlr: String {
    case bsSendCallCode
    case bsSendSMSCode
    case bsSendEmailCode
}

class RestAuthenticationService: AuthenticationService {
    
    private let headers: HTTPHeaders = [
      "sec-ch-ua": "\"Not_A Brand\";v=\"99\", \"Google Chrome\";v=\"109\", \"Chromium\";v=\"109\"",
      "sec-ch-ua-mobile": "?0",
      "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36",
      "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
      "Accept": "*/*",
      "Referer": "https://m.citystarwear.com/lk/profile/",
      "X-Requested-With": "XMLHttpRequest",
      "sec-ch-ua-platform": "\"macOS\""
    ]
    
    private func sendRequestAuthentication(number: String? = nil, email: String? = nil, type: hdlr) {
        let parameters: Parameters = [
            "phone": number ?? "",
            "email": email ?? "",
            "hdlr": type.rawValue,
            "key": "DOvBhIav34535434v212SEoVINS",
            "dataForm": [
                "phone": number ?? "",
                "callNums": "",
                "smsCode": "",
                "email": email ?? "",
                "ecode": ""
            ],
            "4YreJ": "niKOC7pJmi1BET3puazqvly5E",
            "tTCwJ": "nLYUqjASgdo3mKNoGxLNOQrIU",
            "fiGED": "gww88r5FPtbfCTLxYknQCt47t",
            "dyzOM": "y10RWRSMhFnc1JrxETX96Fu8C",
            "VvYbo": "0Ui38ZF9FWGIpmT55oux1K3AV",
            "6jOgK": "8LBnrkukNu9tkFSp3HsbkgKS9",
            "rOzgC": "Yx4lA7UOIScs997ucA0zJau8k",
            "ocRHN": "7itJktUZCsUekX7IKJC3CkC4B",
            "jmzjN": "m5TqxQurYfN6g5coZLNMf512L",
            "eQhnD": "AhYFKa8XHZsAPtrxclwJbKFSh"
        ]
        
        let url = "https://m.citystarwear.com/bitrix/templates/bs-base/php/includes/bs-handlers.php"
        
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print(dataString)
                } else {
                    print("No data received")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func sendSmsCode(number: String) {
        sendRequestAuthentication(number: number, type: hdlr.bsSendSMSCode)
    }
    
    func sendEmailCode(email: String) {
        sendRequestAuthentication(email: email, type: hdlr.bsSendEmailCode)
    }
    
    func sendCallCode(number: String) {
        sendRequestAuthentication(number: number, type: hdlr.bsSendCallCode)
    }
    
    func confirmSmsCode(number: String, code: Int, completion: () -> ()) {
        
    }
    
    func confirmEmailCode(email: String, code: Int, completion: () -> ()) {
        
    }
    
    func confirmCallCode(number: String, code: Int, completion: () -> ()) {
        
    }
    
}
