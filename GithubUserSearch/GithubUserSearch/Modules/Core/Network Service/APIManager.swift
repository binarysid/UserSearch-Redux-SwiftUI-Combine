
import Foundation

// This handles all the configs, properties, cases required for network calls
struct APIManager{
    
    enum CustomError:Error{
        case serviceNotFound
        case badURL
        case noDataFound
        case duplicate
        case invalidResponse(URLResponse?)
        case invalidJSON(Error)
        
        var errorDescription: String {
            switch self {
            case .serviceNotFound: return "Service unreachable"
            case .badURL: return "Invalid URL"
            case .noDataFound: return "No data found"
            case .duplicate: return "Duplicate found"
            case .invalidResponse(let err): return err?.description ?? "invalid response"
            case .invalidJSON(let err): return err.localizedDescription
            }
        }
    }
    
    enum EndPoints{
        static let baseURL =  "https://" + Config.stringValue(forKey: "BASE_URL")
        static let token = Config.stringValue(forKey: "API_KEY")
        
        case userSearch(name:String, limit:Int)
        
        var request:URLRequest?{
            switch self{
            case .userSearch(let name, let limit):
                let url = EndPoints.baseURL + "/search/users"
                return APIManager.getURLRequest(baseURL: url,token:EndPoints.token, paramters: ["q":name,"per_page":String(limit)])
            }
        }
    }
    
    static private func getURLRequest(baseURL:String,token:String,paramters:[String:String])->URLRequest?{
        
        guard var urlComponents = URLComponents(string: baseURL) else{
            return nil
        }
        var queryItems:[URLQueryItem] = []
        for (key,value) in paramters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else{
            return nil
        }
        var request = URLRequest(url: url)
        request.addValue("token \(EndPoints.token)", forHTTPHeaderField: "Authorization")
        return request
    }
}

