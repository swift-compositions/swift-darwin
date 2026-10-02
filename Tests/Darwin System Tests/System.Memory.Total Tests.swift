#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

    import Testing

    @testable import Darwin_System

    enum SystemMemoryTests {
        @Suite struct Tests {
            @Suite struct Unit {
                @Test func `total returns positive value`() {
                    let total = System.memoryCapacity
                    let bytes = total.rawValue
                    #expect(bytes > 0, "Total physical memory must be positive")
                }

                @Test func `total exceeds one megabyte`() {
                    let total = System.memoryCapacity
                    let bytes = total.rawValue
                    let oneMB = 1024 * 1024
                    #expect(bytes > oneMB, "Total memory should exceed 1 MB")
                }

                @Test func `total is consistent across reads`() {
                    let first = System.memoryCapacity.rawValue
                    let second = System.memoryCapacity.rawValue
                    #expect(first == second, "Total memory should be stable between reads")
                }
            }
        }
    }

#endif
