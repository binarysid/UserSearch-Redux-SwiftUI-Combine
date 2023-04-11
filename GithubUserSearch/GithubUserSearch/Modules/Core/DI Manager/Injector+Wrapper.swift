import Foundation

@propertyWrapper
struct Inject<T> {
    let wrappedValue: T
    init() {
        self.wrappedValue = DIContainer.shared.resolve(type: T.self)
    }
}
