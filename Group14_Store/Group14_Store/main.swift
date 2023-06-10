import Foundation

// Creating a customer
let customer = Customer()

// Creating a variety od movies and games
let game1 = Game(id: 1, title: "ELDEN RING", price: 79.99, publisher: "FromSoftware", isMultiplayer: false)
let game2 = Game(id: 2, title: "Assassin's Creed", price: 37.07, publisher: "Ubisoft", isMultiplayer: false)
let game3 = Game(id: 3, title: "PUBG", price: 37.07, publisher: "Tencent", isMultiplayer: true)

let movie1 = Movie(id: 4, title: "Gangs of Wasseypur", price: 10.98, runningTime: 3)
let movie2 = Movie(id: 5, title: "Avengers: Endgame", price: 12.98, runningTime: 2)

// Creating a store and adding movies and games to it
let store = Store(items:[game1,game2,game3,movie1,movie2])

// Searching for item that exist
store.findByTitle(keyword: "Avengers")
store.findByTitle(keyword: "PUBG")

// Searching for item that exist
store.findByTitle(keyword: "SuperBad")

// Trying to purchase an item that the customer cannot afford
store.buyItem(c: customer, itemId: 2)

// Reloading the customer’s gift card so they have sufficient funds
customer.reloadAccount(amount: 200)
store.buyItem(c: customer, itemId: 2)

// Purchasing an item that the user does not own
store.buyItem(c: customer, itemId: 4)
store.buyItem(c: customer, itemId: 5)

// Purchasing an item that the user already own
store.buyItem(c: customer, itemId: 2)

// Using one of the items for more than 30 mins
customer.useItem(id: 4, numMinutes: 120)

// Trying to refund an item that does NOT meet the refund policy requirements
store.issueRefund(c: customer, itemId: 4)

// Trying to refund an item that meet the refund policy
store.issueRefund(c: customer, itemId: 5)
