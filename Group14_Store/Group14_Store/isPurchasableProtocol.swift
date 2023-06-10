import Foundation

protocol isPurchasableProtocol {
    
    // stored property
    var info:  String { get }
    // function 
    func printRecipt(isRefundable:Bool,amount:Double)
}
