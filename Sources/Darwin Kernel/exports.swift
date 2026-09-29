@_exported public import Clock
@_exported public import Darwin_Kernel_Event_Standard
@_exported public import Darwin_Kernel_Standard
@_exported public import Error
@_exported public import ISO_9945_Core
@_exported public import Memory
@_exported public import POSIX_Kernel
@_exported public import Path
@_exported public import Random
@_exported public import System

public typealias Kernel = POSIX.Kernel

public typealias Darwin = Darwin_Kernel_Standard.Darwin

public typealias Random = Random::Random

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
    extension POSIX.Kernel {
        public typealias Kqueue = Darwin.Kernel.Event.Queue
    }
#endif
