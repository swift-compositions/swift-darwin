public import Darwin_Kernel_Standard
public import POSIX_Kernel_File

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

    extension POSIX.Kernel.File.Attributes {

        public typealias Extended = ISO_9945.Kernel.File.Attributes.Extended
    }
#endif
