
import Foundation

protocol DIContainerProtocol {
    func register<Service>(type: Service.Type, component: Any)
    func resolve<Service>(type: Service.Type) -> Service
}

final class DIContainer: DIContainerProtocol {
    
    static let shared = DIContainer()
    var services: [String: Any] = [:]
    
    private init() {}
    
    func register<Service>(type: Service.Type, component: Any) {
        services["\(type)"] = component
    }
    
    func resolve<Service>(type: Service.Type) -> Service {
        let key = "\(type)"
        let dependency = services[key]
        precondition(dependency != nil, "No dependency found for key \(key). Must register dependency before resolving it")
        return dependency as! Service
    }
    
}
