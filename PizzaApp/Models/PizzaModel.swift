//
//  PizzaModel.swift
//  PizzaApp
//
//  Created by Mac on 6/22/23.
//

import Foundation


struct PizzaModel: Codable {
    let pizzaName: String
    let image: String
    let pizzaDescription: String
    let piizzaPrice: String
}

//struct PizzaModel2: Codable {
//    let title: String
//    let image: String
//    let pizzaDescription: String
//    let size: [String]
//    let price: [Int]
//}

struct SaleModel {
    let image: String
}


struct MenuDetailsModel {
    let name: String
    var selected: Bool
}

let saleDatas: [SaleModel] = [
    SaleModel(image: "sale1"),
    SaleModel(image: "sale2"),
    SaleModel(image: "sale3"),
    SaleModel(image: "sale4")
]


struct PizzaModel2: Codable {
    let id: Int
    let title: String
    let image: String
    let pizzaDescription: String
    let size: [String]
    let price: [Int]
}
