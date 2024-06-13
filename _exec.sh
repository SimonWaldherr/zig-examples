#!/bin/bash

# Pfad zum aktuellen Ordner (wo das Skript und die Beispiele liegen)
EXAMPLES_DIR=$(dirname "$0")

# Sicherstellen, dass der Zig-Compiler installiert ist
if ! command -v zig &> /dev/null
then
    echo "Zig could not be found, please install Zig to run this script."
    exit 1
fi

# Überprüfen des Parameters für den Modus (run oder build)
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <run|build>"
    exit 1
fi

MODE=$1

if [ "$MODE" != "run" ] && [ "$MODE" != "build" ]; then
    echo "Invalid mode: $MODE"
    echo "Usage: $0 <run|build>"
    exit 1
fi

# Funktion, um ein Zig-Beispiel auszuführen
run_zig_example() {
    local example_file=$1
    local example_name=$(basename "$example_file" .zig)
    
    echo "Processing $example_name.zig..."
    
    if [ "$MODE" == "run" ]; then
        # Beispiel ausführen
        zig run "$example_file"
    elif [ "$MODE" == "build" ]; then
        # Beispiel kompilieren und ausführen
        # Erstellen eines temporären Ordners für Build-Artefakte
        BUILD_DIR=$(mktemp -d -t zigbuild-XXXXXX)
        
        zig build-exe "$example_file" -femit-bin="$BUILD_DIR/$example_name" && "$BUILD_DIR/$example_name"
        
        # Entfernen des temporären Build-Ordners
        rm -rf "$BUILD_DIR"
    fi
}

# Durchsuchen des Ordners nach Zig-Beispielen und Ausführen jedes Beispiels
for example in "$EXAMPLES_DIR"/*.zig; do
    if [ -f "$example" ]; then
        run_zig_example "$example"
        echo ""
    fi
done

echo "All Zig examples have been processed."
