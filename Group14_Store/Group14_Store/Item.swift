import Foundation

class Item: isPurchasableProtocol{
    
    // stored property and initialization of Item class
    let id:Int
    let title:String
    var price:Double
    
    init(_ id: Int,_ title: String,_ price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
    
    // properties which is retrieved from protocol
    var info: String {
        return "\(self.title) \(self.price)"
    }
        
    func printRecipt(isRefundable: Bool, amount: Double) {
        if(isRefundable){
            print("------------------")
            print("YOUR RECIPT")
            print("------------------")
            print("We are refunding the purchase of \(self.title)")
            print("Refund amount: $\(amount)")
        }else{
            print("------------------")
            print("YOUR RECIPT")
            print("------------------")
            print("Thank you for purchasing \(self.title)")
            print("Purchase amount: $\(amount)")
        }
    }
}
