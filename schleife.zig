
const std = @import("std");

pub fn main() void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        std.debug.print("i = {d}\n", .{i});
    }
}
