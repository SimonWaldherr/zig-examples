
const std = @import("std");

const Color = enum {
    Red,
    Green,
    Blue,
};

pub fn main() void {
    const myColor: Color = Color.Green;

    switch (myColor) {
        Color.Red => std.debug.print("Farbe ist Rot\n", .{}),
        Color.Green => std.debug.print("Farbe ist Grün\n", .{}),
        Color.Blue => std.debug.print("Farbe ist Blau\n", .{}),
    }
}
