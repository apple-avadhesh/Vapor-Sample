import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Employee: SQLiteModel {
    var id: Int?
    var name: String
    var employeeCode: String
    var contactNumber: String
    var bloodGroup: String
    
    
    init(id: Int? = nil, name: String, employeeCode: String, contactNumber: String, bloodGroup: String) {
        self.id = id
        self.name = name
        self.employeeCode = employeeCode
        self.contactNumber = contactNumber
        self.bloodGroup = bloodGroup
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Employee: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Employee: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Employee: Parameter { }
