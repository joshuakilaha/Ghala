//
//  UserFiles.swift
//  Ghala
//
//  Created by mroot on 27/05/2022.
//

import Foundation

enum FromUserDefault {
    static let token = UserDefaults.standard.string(forKey: "access_token") //get current access token from
    static let warehouse_ID = UserDefaults.standard.string(forKey: "warehouse_Id") //get warehouseId
    
  //  let token = UserDefaults.standard.string(forKey: "access_token") //get current access token from
  //  static let wareHouse_Id = Int(UserDefaults.standard.string(forKey: "warehouse_Id")!) //get warehouseId
}