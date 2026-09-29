import ISO_9945_Kernel_System
import Testing

@testable import Darwin_System

enum SystemPhysicalProcessorTests {
    @Suite struct Tests {
        @Suite struct Unit {
            @Test func `count returns at least one`() {
                let count = System.physicalProcessorCount
                let value = Int(count)
                #expect(value >= 1, "Physical processor count must be at least 1")
            }

            @Test func `count does not exceed logical processor count`() {
                let physical = Int(System.physicalProcessorCount)
                let logical = System.processorCount
                #expect(
                    physical <= logical,
                    "Physical cores (\(physical)) should not exceed logical processors (\(logical))"
                )
            }

            @Test func `count is consistent across reads`() {
                let first = Int(System.physicalProcessorCount)
                let second = Int(System.physicalProcessorCount)
                #expect(first == second, "Physical processor count should be stable between reads")
            }
        }
    }
}
