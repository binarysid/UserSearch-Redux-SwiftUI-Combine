// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum TextConstant {
  /// Localized.strings
  ///   GithubUserSearch
  /// 
  ///   Created by Linkon Sid on 12/4/23.
  internal static let appTitle = TextConstant.tr("Localized", "appTitle", fallback: "GitUserSearch")
  internal enum Images {
    /// multiply.circle.fill
    internal static let circleFill = TextConstant.tr("Localized", "Images.circleFill", fallback: "multiply.circle.fill")
    /// magnifyingglass
    internal static let magnifyingGlass = TextConstant.tr("Localized", "Images.magnifyingGlass", fallback: "magnifyingglass")
  }
  internal enum NetworkError {
    /// Invalid URL
    internal static let badURL = TextConstant.tr("Localized", "NetworkError.badURL", fallback: "Invalid URL")
    /// Duplicate found
    internal static let duplicate = TextConstant.tr("Localized", "NetworkError.duplicate", fallback: "Duplicate found")
    /// Invalid Json Data
    internal static let invalidJson = TextConstant.tr("Localized", "NetworkError.invalidJson", fallback: "Invalid Json Data")
    /// Invalid response
    internal static let invalidResponse = TextConstant.tr("Localized", "NetworkError.invalidResponse", fallback: "Invalid response")
    /// No Internet conncetion
    internal static let noConnection = TextConstant.tr("Localized", "NetworkError.noConnection", fallback: "No Internet conncetion")
    /// No data found
    internal static let noDataFound = TextConstant.tr("Localized", "NetworkError.noDataFound", fallback: "No data found")
    /// Service unreachable
    internal static let serviceNotFound = TextConstant.tr("Localized", "NetworkError.serviceNotFound", fallback: "Service unreachable")
    /// There is already a task running 
    internal static let taskRunning = TextConstant.tr("Localized", "NetworkError.taskRunning", fallback: "There is already a task running ")
  }
  internal enum Search {
    internal enum SearchBar {
      /// Cancel
      internal static let cancel = TextConstant.tr("Localized", "Search.SearchBar.cancel", fallback: "Cancel")
      /// Search...
      internal static let title = TextConstant.tr("Localized", "Search.SearchBar.title", fallback: "Search...")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension TextConstant {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
