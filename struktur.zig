
const std = @import("std");

const Person = struct {
    name: []const u8,
    age: u8,

    pub fn greet(self: *const Person) void {
        std.debug.print("Hallo, mein Name ist {s} und ich bin {d} Jahre alt.\n", .{self.name, self.age});
    }
};

pub fn main() void {
    const person = Person{
        .name = "Simon",
        .age = 35,
    };

    person.greet();
}
