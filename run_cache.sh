#!/bin/bash

# Check if two arguments were provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_shapefile> <output_geojson>"
    exit 1
fi

# Set the input and output file names from command-line arguments
input_shapefile="$1"
output_geojson="$2"

# Convert Shapefile to GeoJSON and sort it
python sort_shapefile.py "$input_shapefile" "$output_geojson"

# Create mbtiles using Tippecanoe
tippecanoe -o "${output_geojson%.geojson}.mbtiles" "$output_geojson" -Z0 -z10 --preserve-input-order
