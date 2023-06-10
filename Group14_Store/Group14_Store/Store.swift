import Foundation

class Store {
    
    // stored property of store class and initializing it
    var items:[Item] = []
    
    init(items: [Item]) {
        self.items = items
    }
    
    // function to search an item in the stored by title and display the information
    func findByTitle(keyword:String){
        for item in items{
            if(item.title.lowercased().contains(keyword.lowercased())){
                if item is Game{
                    print("--------------------------")
                    print("[GAME] \(item.info)")
                    return
                }else{
                    print("--------------------------")
                    print("[MOVIE] \(item.info)")
                    return
                }
            }
        }
        print("-------------------------")
        print("Sorry no item found in the store")
    }
    
    // func to buy an item from the store
    func buyItem(c:Customer,itemId:Int){
        // checks if the item is already bought or not is yes display a message since we cannot buy an already bought item again
        for ownedItem in c.itemsList{
            if(itemId == ownedItem.id){
                print("-------------------------")
                print("You already own a copy of \(ownedItem.title)")
                return
            }
        }
        
        for item in items{
            if(item.id == itemId){
                // checks if there is sufficient balance in the customer's wallet in order to make the purchase is not display a specific message
                if(item.price > c.balance){
                    print("-------------------------")
                    print("Insufficient funds. The price of \(item.title) is $\(item.price), but your balance is $\(c.balance).")
                    return
                }
                // is yes then deducting the amount of the item from the customer's wallet and printing the recipt of the item
                else{
                    c.balance -= item.price
                    let ownedItem = OwnedItem(item.id,item.title,item.price)
                    c.itemsList.append(ownedItem)
                    print("-------------------------")
                    print("Purchase Successful")
                    item.printRecipt(isRefundable: false, amount: item.price)
                    print("Remaining Balance: \(c.balance)")
                }
            }
        }
    }
    
    // func to issue refund for a perticualr item
    func issueRefund(c:Customer,itemId:Int){
        
        // finding the index of the item in order to remove it later
        guard let index = c.itemsList.firstIndex(where: { $0.id == itemId })
        else { return }
        
        //Checking the refund policy and providing the refund accordingly and printing recipt using the printReciot function of Item
        for ownedItem in c.itemsList{
            if(ownedItem.id == itemId){
                if(ownedItem.minutesUsed <= 30){
                    c.balance += ownedItem.price
                    ownedItem.printRecipt(isRefundable: true, amount: c.balance)
                    c.itemsList.remove(at: index)
                    print("-------------------------")
                    print("Refund Successful..!")
                    return
                }else{
                    print("-------------------------")
                    print("Refund cannot be issued since you have watched \(ownedItem.minutesUsed) mins of \(ownedItem.title) which is more tha 30 mins as per requirnment")
                }
            }
        }
    }
}

