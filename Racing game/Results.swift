
import Foundation

struct Results: Codable {
    var name: String
    var time: String
    var distance: String
    var date: String
    
//    init(name: String , time: String, distance: String, date: String) {
//        self.name = name
//        self.time = time
//        self.distance = distance
//        self.date = date
//    }
//    
//    private enum CodingKeys: String, CodingKey {
//        case name, time, distance, date
//    }
//    
//    required public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.name = try container.decode(String.self, forKey: .name)
//        self.time = try container.decode(String.self, forKey: .time)
//        self.distance = try container.decode(String.self, forKey: .distance)
//        self.date = try container.decode(String.self, forKey: .date)
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.time, forKey: .time)
//        try container.encode(self.distance, forKey: .distance)
//        try container.encode(self.date, forKey: .date)
//    }
}
