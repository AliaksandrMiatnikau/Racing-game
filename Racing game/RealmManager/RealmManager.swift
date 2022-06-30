
import Foundation
import UIKit
import RealmSwift



class RealmManager {
    static let shared = RealmManager()
    let realm = try? Realm()
    private init() {}
}

extension RealmManager {
    func getSomeObject() -> [SavedResult]? {
        var someObjects: [SavedResult] = []
        guard let objects = realm?.objects(SavedResult.self) else {
            return someObjects
        }
        for object in objects{
            someObjects += [object]
        }
        return someObjects 
    }
    
    
    func writeResult(result: SavedResult) {
        try? realm?.write {
            realm?.add(result)
        }
    }
    
    func deleteAll() {
        try? realm?.write {
            realm?.deleteAll()
        }
    }
}


