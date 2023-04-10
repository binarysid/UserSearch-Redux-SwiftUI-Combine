import Foundation

// This handles all the configs, properties, cases required for network calls
struct RequestManager {

    static func getURLRequest(baseURL: String, token: String, queryParams: [String: String], headers: [String: String]?) -> URLRequest? {

        guard var urlComponents = URLComponents(string: baseURL) else {
            return nil
        }
        var queryItems: [URLQueryItem] = []
        for (key, value) in queryParams {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            return nil
        }
        var request = URLRequest(url: url)
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}
