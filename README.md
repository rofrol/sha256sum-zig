## Usage

```shell
% zig build run -- ~/Downloads/gu9m3isal4ga1.jpg
9747fe70814f566b6ccfaf624fac8cb59d66203fbbb48fd8110eac49efdeb98e
```

Or

```shell
% zig build
% ./zig-out/bin/sha256sum ~/Downloads/gu9m3isal4ga1.jpg
9747fe70814f566b6ccfaf624fac8cb59d66203fbbb48fd8110eac49efdeb98e
```

## Links

- sha256 example https://github.com/ziglang/zig/issues/13400
- from hex https://github.com/hexops/mach/blob/35ae2d7ac795395291d0cd95646ac138a48c8762/tools/wasmserve/wasmserve.zig#L1171
- https://github.com/tigerbeetledb/tigerbeetle/blob/0e32c5b5c5a38fb42946d2bc5451a3e87f759be7/src/vopr.zig#L377
- https://github.com/kubkon/zld/blob/4800da973230dae0897892a4d89666b39d096791/src/MachO/CodeSignature.zig#L304
- https://github.com/mathetake/proxy-wasm-zig-sdk/blob/75e2a742912f85bcdd2b7baf33610a45cb1c9105/example/example.zig#L740
- https://ziglearn.org/chapter-2/#crypto
- [A tour of std.crypto in Zig 0.7.0 - Frank Denis - YouTube](https://www.youtube.com/watch?v=9t6Y7KoCvyk)
- https://stackoverflow.com/questions/70189554/how-can-you-create-a-buffer-of-the-same-size-as-a-file/72334950#72334950
- https://stackoverflow.com/questions/68368122/how-to-read-a-file-in-zig/68879352#68879352
