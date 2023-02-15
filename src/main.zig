const std = @import("std");
const extras = @import("extras");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const args_allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const args = try std.process.argsAlloc(args_allocator);
    defer std.process.argsFree(args_allocator, args);

    const hash = try extras.hashFile(std.fs.cwd(), args[1], std.crypto.hash.sha2.Sha256);
    std.debug.print("{s}\n", .{hash});
}
