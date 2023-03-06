//
//  AuthenticationService.swift
//  CitystarwearApp
//
//  Created by Илья Казначеев on 06.03.2023.
//

import Foundation

// 3 метода отправки кода пользователю (sms, последние 4 цифры с номера, email)
// 3 метода подтверждения кода для каждого метода

protocol AuthenticationService {
    
    func sendSmsCode(number: String) -> ()
    func sendEmailCode(email: String) -> ()
    func sendCallCode(number: String) -> ()
    
    func confirmSmsCode(number: String, code: Int, completion: () -> ())
    func confirmEmailCode(email: String, code: Int, completion: () -> ())
    func confirmCallCode(number: String, code: Int, completion: () -> ())
    
}
