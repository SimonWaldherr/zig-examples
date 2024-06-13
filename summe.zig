
const std = @import("std");

pub fn main() void {
    const a: i32 = 5;
    const b: i32 = 7;
    const sum: i32 = add(a, b);
    std.debug.print("Summe von {d} und {d} ist {d}\n", .{a, b, sum});
}

fn add(x: i32, y: i32) i32 {
    return x + y;
}
