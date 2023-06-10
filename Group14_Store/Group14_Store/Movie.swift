import Foundation

class Movie:Item {
    
    // stored property of movie class along with the initialization of the parent class Item defining a is-a relationship between the classes
    let runningTime:Int
    
    init(id: Int,title: String,price: Double,runningTime: Int ) {
        self.runningTime = runningTime
        super.init(id, title, price)
    }
    
    // property of proptocol which is inherited from item class throught the proptocol hence we have to override it
    override var info: String {
        return """
                \(self.title), \(self.price)
                Running Time: \(self.runningTime)
                """
    }
}
