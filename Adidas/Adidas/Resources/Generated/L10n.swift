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

  internal enum Goals {
    /// Select your goal
    internal static let title = L10n.tr("Localizable", "goals.title")
    internal enum Label {
      /// Loading your goals
      internal static let loading = L10n.tr("Localizable", "goals.label.loading")
    }
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
      /// You haven't set any goal yet.\nTAP HERE TO SET YOUR GOAL
      internal static let setGoal = L10n.tr("Localizable", "menu.cell.set_goal")
    }
    internal enum Header {
      /// Always remember your goal
      internal static let goal = L10n.tr("Localizable", "menu.header.goal")
      /// Your workouts
      internal static let workouts = L10n.tr("Localizable", "menu.header.workouts")
    }
  }

  internal enum Profile {
    /// My Profile
    internal static let title = L10n.tr("Localizable", "profile.title")
    internal enum Error {
      /// Something went wrong while getting your profile
      internal static let gettingProfile = L10n.tr("Localizable", "profile.error.getting_profile")
    }
    internal enum Gender {
      /// Female
      internal static let female = L10n.tr("Localizable", "profile.gender.female")
      /// Male
      internal static let male = L10n.tr("Localizable", "profile.gender.male")
      /// Other
      internal static let other = L10n.tr("Localizable", "profile.gender.other")
    }
    internal enum Label {
      /// Date of Birth
      internal static let dateOfBirth = L10n.tr("Localizable", "profile.label.dateOfBirth")
      /// Gender
      internal static let gender = L10n.tr("Localizable", "profile.label.gender")
    }
  }

  internal enum Workout {
    internal enum Alert {
      /// Something went wrong while saving your workout
      internal static let error = L10n.tr("Localizable", "workout.alert.error")
      /// Something went wrong while getting your workouts
      internal static let getError = L10n.tr("Localizable", "workout.alert.get_error")
    }
    internal enum Button {
      /// Save
      internal static let save = L10n.tr("Localizable", "workout.button.save")
      /// Stop
      internal static let stop = L10n.tr("Localizable", "workout.button.stop")
    }
    internal enum Control {
      /// Running
      internal static let run = L10n.tr("Localizable", "workout.control.run")
      /// Walking
      internal static let walk = L10n.tr("Localizable", "workout.control.walk")
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
