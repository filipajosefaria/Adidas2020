// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Alert {
    /// OK
    internal static let ok = L10n.tr("Localizable", "alert.ok")
    /// Alert
    internal static let title = L10n.tr("Localizable", "alert.title")
  }

  internal enum Healthkit {
    internal enum Error {
      /// Health kit does not have all the information needed
      internal static let dataUnavailable = L10n.tr("Localizable", "healthkit.error.data_unavailable")
      /// Something went wrong with Health Kit
      internal static let general = L10n.tr("Localizable", "healthkit.error.general")
      /// Health kit is not available on your device
      internal static let unavailable = L10n.tr("Localizable", "healthkit.error.unavailable")
    }
    internal enum Message {
      /// You need to allow Health Kit
      internal static let permissionNotGranted = L10n.tr("Localizable", "healthkit.message.permission_not_granted")
    }
  }

  internal enum Menu {
    /// Adidas Health
    internal static let title = L10n.tr("Localizable", "menu.title")
    internal enum Button {
      /// View Profile
      internal static let profile = L10n.tr("Localizable", "menu.button.profile")
    }
    internal enum Cell {
      /// Tap to start a new workout
      internal static let newWorkout = L10n.tr("Localizable", "menu.cell.new_workout")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
