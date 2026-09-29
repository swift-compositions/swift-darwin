public import System

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

    internal import Darwin_Kernel_Standard

    extension System {

        public static var physicalProcessorCount: Int {
            let value: Int32
            do throws(Darwin.Kernel.Sysctl.Error) {
                value = try Darwin.Kernel.Sysctl.byName("hw.physicalcpu", as: Int32.self)
            } catch {
                value = 0
            }
            guard value > 0 else { return 1 }
            guard let count = Int(exactly: value) else {
                preconditionFailure("Physical processor count is not representable as Int")
            }
            return count
        }
    }

#endif
