#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

    public import Darwin_Kernel_Standard

    extension POSIX.Kernel.Thread {

        public typealias ID = Darwin.Kernel.Thread.ID
    }

#endif
