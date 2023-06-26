//
//  PizzaModel.swift
//  PizzaApp
//
//  Created by Mac on 6/22/23.
//

import Foundation


struct PizzaModel {
    let pizzaName: String
    let image: String
    let pizzaDescription: String
    let piizzaPrice: String
}

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

let menuData: [MenuDetailsModel] = [
    MenuDetailsModel(name: "Пицца", selected: false),
    MenuDetailsModel(name: "Комбо", selected: false),
    MenuDetailsModel(name: "Напитки", selected: false),
    MenuDetailsModel(name: "Десерт", selected: false),
    MenuDetailsModel(name: "Бургеры", selected: false)
]




let pizzaData: [PizzaModel] = [
    
    PizzaModel(pizzaName: "Сырный цыпленок", image: "ciplenok", pizzaDescription: "Цыпленок, смесь сыров чеддер и пармезан, томаты, соус альфредо, чеснок, соус сырный", piizzaPrice: "от 500 р"),
    PizzaModel(pizzaName: "Чиззи Чеддер", image: "chedder", pizzaDescription: "Сыр моцарелла , ветчина из курицы, сладкий перец, итальянские травы, чеснок, томатный соус, сыр чеддер", piizzaPrice: "от 350 р"),
    PizzaModel(pizzaName: "Чоризо фреш 🌶️", image: "chorizo", pizzaDescription: "Сыр моцарелла, томатный соус, сладкий перец, острая чоризо из цыпленка", piizzaPrice: "от 400 р"),
    PizzaModel(pizzaName: "Бургер-пицца", image: "burgerpizza", pizzaDescription: "Сыр моцарелла, соус бургер, ветчина халяль, маринованные огурчики, красный лук, томаты", piizzaPrice: "от 499 р"),
    PizzaModel(pizzaName: "Пицца из половинок", image: "polovinok", pizzaDescription: "Соберите свою пиццу 35 см с двумя разными вкусами", piizzaPrice: "от 299 р"),
    PizzaModel(pizzaName: "Аррива!", image: "arriva", pizzaDescription: "Сыр моцарелла, соус ранч, соус бургер, цыпленок, острая чоризо из цыпленка, сладкий перец, красный лук, томаты, чеснок", piizzaPrice: "от 500 р"),
    PizzaModel(pizzaName: "Пепперони", image: "peperoni", pizzaDescription: "Увеличенная порция моцареллы, томатный соус, пепперони из цыпленка", piizzaPrice: "от 599 р"),
    PizzaModel(pizzaName: "Додо", image: "dodo", pizzaDescription: "Сыр моцарелла, томатный соус, пикантная пепперони из цыпленка, ветчина из цыпленка, митболы из говядины, томаты, сладкий перец, красный лук, шампиньоны, чеснок", piizzaPrice: "от 499 р"),
    PizzaModel(pizzaName: "Вулкано 🌶️🌶️", image: "vulcano", pizzaDescription: "Сыр моцарелла, томатный соус, соус барбекю, митболы из говядины, острая чоризо из цыпленка, острый перец халапеньо, сладкий перец, красный лук, томаты", piizzaPrice: "от 599 р"),
    PizzaModel(pizzaName: "Сырная 🌱", image: "sirnaya", pizzaDescription: "Сыр моцарелла, соус альфредо, смесь сыров чеддер и пармезан", piizzaPrice: "от 299 р"),
    PizzaModel(pizzaName: "Маргарита 🌱", image: "margarita", pizzaDescription: "Увеличенная порция моцареллы, томатный соус, томаты, итальянские травы", piizzaPrice: "от 499 р"),
    PizzaModel(pizzaName: "Мясная 🌶️", image: "myasnaya", pizzaDescription: "Сыр моцарелла, томатный соус, цыпленок, пикантная пепперони из цыпленка, ветчина из цыпленка, острая чоризо из цыпленка", piizzaPrice: "от 499 р"),

]
