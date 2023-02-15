const std = @import("std");
const string = []const u8;

pub fn hashFile(dir: std.fs.Dir, sub_path: string, comptime Algo: type) ![Algo.digest_length * 2]u8 {
    const file = try dir.openFile(sub_path, .{});
    defer file.close();
    var h = Algo.init(.{});
    var out: [Algo.digest_length]u8 = undefined;
    try pipe(file.reader(), h.writer());
    h.final(&out);
    var res: [Algo.digest_length * 2]u8 = undefined;
    var fbs = std.io.fixedBufferStream(&res);
    try std.fmt.format(fbs.writer(), "{x}", .{std.fmt.fmtSliceHexLower(&out)});
    return res;
}

pub fn pipe(reader_from: anytype, writer_to: anytype) !void {
    var buf: [std.mem.page_size]u8 = undefined;
    var fifo = std.fifo.LinearFifo(u8, .Slice).init(&buf);
    defer fifo.deinit();
    try fifo.pump(reader_from, writer_to);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const args_allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const args = try std.process.argsAlloc(args_allocator);
    defer std.process.argsFree(args_allocator, args);

    const hash = try hashFile(std.fs.cwd(), args[1], std.crypto.hash.sha2.Sha256);
    std.debug.print("{s}\n", .{hash});
}
