//
//  alertServices.swift
//  diffabledataSource
//
//  Created by sayone73 on 30/11/2020.
//

import UIKit

class AlertServices {
    
    func createUserAlert(completion: @escaping (String) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: "create User", message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Enter Users name"}
        let action = UIAlertAction(title: "Save", style: .default) { (_) in
            let username = alert.textFields?.first?.text ?? ""
            completion(username)
        }
        alert.addAction(action)
        return alert
    }
}
