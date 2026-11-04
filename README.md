# swift-darwin

Use this package when you write code for Apple platforms against the kernel and want the POSIX layer from swift-posix plus what only Darwin has, such as kqueue, full and barrier fsync, and `arc4random`. Start from `Kernel`, which is `POSIX.Kernel` with the Darwin additions, and from `Darwin` for Darwin-only types. If the same code must also run on Linux or Windows, use swift-kernel. For Linux only, use swift-linux. The raw Darwin declarations themselves live in swift-darwin-standard.

## Laws

- `ISO_9945.Kernel.File.Flush.full(_:)` does a full fsync. `ISO_9945.Kernel.File.Flush.data(_:)` does the same barrier fsync as `ISO_9945.Kernel.File.Flush.barrier(_:)`. Neither does a full fsync.
- All three flushes retry by themselves when the call is interrupted by a signal, so an interruption never reaches the caller.
- `Random.fill(_:)` fills the buffer from `arc4random`. An empty buffer is allowed and does nothing.
