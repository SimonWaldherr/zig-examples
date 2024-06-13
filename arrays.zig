
const std = @import("std");

pub fn main() void {
    const numbers: [5]i32 = [_]i32{1, 2, 3, 4, 5};
    var sum: i32 = 0;

    for (numbers) |num| {
        sum += num;
    }

    std.debug.print("Summe des Arrays ist {d}\n", .{sum});
}
