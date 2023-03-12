
import Foundation

struct APIManager{
    enum HTTPMethods{
        static let GET = "GET"
        static let POST = "POST"
    }
    enum CustomError:Error{
        case ServiceNotFound
        case BadURL
        case NoDataFound
        case duplicate
        case invalidResponse(URLResponse?)
        case invalidJSON(Error)

        var errorDescription: String {
          switch self {
          case .ServiceNotFound: return "Service unreachable"
          case .BadURL: return "Invalid URL"
          case .NoDataFound: return "No data found"
          case .duplicate: return "Duplicate found"
          case .invalidResponse(let err): return err?.description ?? "invalid response"
          case .invalidJSON(let err): return err.localizedDescription
          }
        }
    }
    
    enum EndPoints{
//        static let baseURL =  "https://" + Config.stringValue(forKey: "BASE_URL")
        static let baseURL = "https://api.github.com/search/users"
        static let token = "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"
        
        case Users(name:String)
        
        var request:URLRequest?{
            switch self{
            case .Users(let name):
                return APIManager.getURLRequest(baseURL: EndPoints.baseURL,token:EndPoints.token, paramters: ["q":name])
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
