import geopandas as gpd
import sys

def sort_shapefile(input_file, output_file):
    # Read the shapefile
    gdf = gpd.read_file(input_file)

    # Create a new column with the sort order
    category_order = {'Ia': 1, 'Ib': 2, 'II': 3, 'III': 4, 'IV': 5, 'V': 6, 'VI': 7, 'Not Applicable': 8, 'Not Reported': 9}
    gdf['sort_order'] = gdf['IUCN_CAT'].map(category_order)
    gdf_sorted = gdf.sort_values(by='sort_order')

    # Write to a new GeoJSON file
    gdf_sorted.to_file(output_file, driver='GeoJSON')

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python sort_shapefile.py <input_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    sort_shapefile(input_file, output_file)
