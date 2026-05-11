//
// Copyright © 2026 Stream.io Inc. All rights reserved.
//

import Foundation

extension DateFormatter {
    public static func makeDefault() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }

    /// Formatter that is used to format date for scrolling overlay that should display
    /// day when message below was sent
    public static var messageListDateOverlay: DateFormatter = {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMMdd")
        df.locale = .autoupdatingCurrent
        return df
    }()
    
    /// Formats the date for the message list overlay.
    /// Shows the year only if the date is from a previous year.
    public static func dateToStringFormatted(from date: Date) -> String {
        let calendar = Calendar.autoupdatingCurrent
        let now = Date()

        let formatter = DateFormatter()
        formatter.locale = .autoupdatingCurrent

        let dateYear = calendar.component(.year, from: date)
        let currentYear = calendar.component(.year, from: now)

        if dateYear < currentYear {
            formatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy")
        } else {
            formatter.setLocalizedDateFormatFromTemplate("MMM d")
        }

        return formatter.string(from: date)
    }
}

extension DateComponentsFormatter {
    static var minutes: DateComponentsFormatter = {
        let df = DateComponentsFormatter()
        df.allowedUnits = [.minute]
        df.unitsStyle = .full
        return df
    }()

    static let videoDuration: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
}

extension NumberFormatter {
    static let uploadingPercentage: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()
}
