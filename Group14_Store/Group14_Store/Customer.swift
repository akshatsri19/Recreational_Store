import Foundation

class Customer{
    
    // stored property of customer class along with the initializations
    var balance:Double
    // list of owed items defining a has-a relationship between the classes
    var itemsList:[OwnedItem]
    
    init (balance:Double = 10){
        self.balance = balance
        self.itemsList = []
    }
    
    // functions to reload amount and to use an item i.e movie 
    func reloadAccount(amount:Double){
        self.balance = amount
    }
    
    func useItem(id:Int, numMinutes:Int){
        for item in itemsList{
            if(item.id == id){
                item.minutesUsed += numMinutes
            }
        }
    }
}
