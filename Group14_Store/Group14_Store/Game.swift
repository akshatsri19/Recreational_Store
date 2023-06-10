import Foundation

class Game:Item {
    
    // stored property of Game class along with the initializations of the parent class Item defining a is-a relationship between the classes
    var publisher:String
    var isMultiplayer:Bool
    
    init(id: Int,title: String,price: Double, publisher:String, isMultiplayer: Bool) {
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        super.init(id,title,price)
    }
    
    // property of proptocol which is inherited from item class throught the proptocol hence we have to override it
    override var info: String{
        return """
                \(self.title), \(self.price)
                Publisher: \(self.publisher)
                Is Multiplayer: \(self.isMultiplayer)
                """
    }
}
