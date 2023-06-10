import Foundation

class OwnedItem:Item {
    
    // stored property of Owned Item class along with the default initializaions
    var minutesUsed:Int
    
    init(_ id: Int,_ title: String,_ price: Double,_ minutesUsed: Int = 0) {
        self.minutesUsed = minutesUsed
        super.init(id,title,price)
    }
}
