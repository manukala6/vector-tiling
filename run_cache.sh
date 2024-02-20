#!/bin/bash

# Convert Shapefile to GeoJSON
ogr2ogr -f "GeoJSON" wdpa_full.geojson wdpa_full.shp

# Create mbtiles using Tippecanoe
tippecanoe -o wdpa_full.mbtiles wdpa_full.geojson -Z0 -z10 --drop-densest-as-needed --order-by=IUCN_CAT
