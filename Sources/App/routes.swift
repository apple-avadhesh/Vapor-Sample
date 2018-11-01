import Vapor

public func routes(_ router: Router) throws {
    
    let employeeController = EmployeeController()
    router.get("employees", use: employeeController.list)
    router.post("employees", use: employeeController.create)
    router.patch("employees", Employee.parameter, use: employeeController.update)
    router.delete("employees", Employee.parameter, use: employeeController.delete)
}
