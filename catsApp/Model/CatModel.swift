//
//  CatModel.swift
//  catsApp
//
//  Created by Harold Villacob on 18/05/23.
//

import Foundation

struct CatModel: Codable {
    let id: String
    let name: String
    let origin: String
    let affection_level: Int
    let intelligence: Int
    let reference_image_id: String?
}
