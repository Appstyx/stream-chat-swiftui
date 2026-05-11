//
// Copyright © 2026 Stream.io Inc. All rights reserved.
//

import StreamChat
import SwiftUI

public struct RecordingDurationView: View {
    @Injected(\.utils) private var utils
    @Injected(\.colors) private var colors
    
    var duration: TimeInterval
    
    public init(duration: TimeInterval) {
        self.duration = duration
    }
    
    public var body: some View {
        Text(utils.videoDurationFormatter.format(duration) ?? "")
            .font(.caption.monospacedDigit())
            .fontWeight(.semibold)
            .foregroundColor(Color(colors.textLowEmphasis))
    }
}
