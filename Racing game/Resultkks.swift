
import Foundation

class Settings: Codable {
    var vehicle: Int
    var name: String
    var speed = 1
    var obstruction: Int
    
    
    init(vehicle: Int , name: String, speed: Int, obstruction: Int) {
        self.vehicle = vehicle
        self.name = name
        self.speed = speed
        self.obstruction = obstruction
       
        
    }
    private enum CodingKeys: String, CodingKey {
        case vehicle, name, speed, obstruction, roadsideDanger
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.vehicle = try container.decode(Int.self, forKey: .vehicle)
        self.name = try container.decode(String.self, forKey: .name)
        self.speed = try container.decode(Int.self, forKey: .speed)
        self.obstruction = try container.decode(Int.self, forKey: .obstruction)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.vehicle, forKey: .vehicle)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.speed, forKey: .speed)
        try container.encode(self.obstruction, forKey: .obstruction)
      
    }
}
