public import Cardinal
public import System

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

    internal import Darwin_Kernel_Standard

    extension System {

        public static var memoryCapacity: Cardinal {
            let value: UInt64
            do throws(Darwin.Kernel.Sysctl.Error) {
                value = try Darwin.Kernel.Sysctl.byName("hw.memsize", as: UInt64.self)
            } catch {
                value = 0
            }
            guard let bytes = UInt(exactly: value) else {
                preconditionFailure("Memory capacity is not representable as UInt")
            }
            return Cardinal(bytes)
        }
    }

#endif
