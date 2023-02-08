const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const args_allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const args = try std.process.argsAlloc(args_allocator);
    defer std.process.argsFree(args_allocator, args);

    var file = try std.fs.cwd().openFile(args[1], .{ .mode = .read_only });
    const file_size = (try file.stat()).size;
    const allocator = std.heap.page_allocator;
    var buffer = try allocator.alloc(u8, file_size);
    try file.reader().readNoEof(buffer);

    const Sha256 = std.crypto.hash.sha2.Sha256;
    var checksum: [Sha256.digest_length]u8 = undefined;
    Sha256.hash(buffer, &checksum, .{});
    var checksum_hash: [Sha256.digest_length * 2]u8 = undefined;
    _ = try std.fmt.bufPrint(
        &checksum_hash,
        "{s}",
        .{std.fmt.fmtSliceHexLower(&checksum)},
    );
    std.debug.print("{s}\n", .{checksum_hash});
}
