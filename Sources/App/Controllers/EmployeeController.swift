import Vapor

/// Controls basic CRUD operations on Employees.
final class EmployeeController {
    
    // view with employees
    func list(_ req: Request) throws -> Future<[Employee]> {
        return Employee.query(on: req).all()
    }
    
    // create a new employee
    func create(_ req: Request) throws -> Future<Employee> {
        return try req.content.decode(Employee.self).flatMap { employee in
            return employee.save(on: req)
        }
    }
    
    // update a employee
    func update(_ req: Request) throws -> Future<Employee> {
        return try req.parameters.next(Employee.self).flatMap { employee in
            return try req.content.decode(Employee.self).flatMap { newEmployee in
                employee.name = newEmployee.name
                employee.bloodGroup = newEmployee.bloodGroup
                employee.contactNumber = newEmployee.contactNumber
                return employee.save(on: req)
            }
        }
    }
    
    // delete a employee
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Employee.self).flatMap { employee in
            return employee.delete(on: req)
            }.transform(to: .ok)
    }
}
