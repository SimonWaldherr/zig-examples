
const std = @import("std");

pub fn main() void {
    const num: u32 = 5;
    const result: u32 = factorial(num);
    std.debug.print("Fakultät von {d} ist {d}\n", .{num, result});
}

fn factorial(n: u32) u32 {
    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
