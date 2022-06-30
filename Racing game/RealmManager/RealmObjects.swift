

import Foundation
import Realm
import RealmSwift

class SavedResult: Object {
    @objc dynamic var time: String = ""
    @objc dynamic var distance: Int = 0
    @objc dynamic var date: String = ""
    
    convenience init(time: String, distance: Int, date: String) {
        self.init()
        self.time = time
        self.distance = distance
        self.date = date
    }
}

