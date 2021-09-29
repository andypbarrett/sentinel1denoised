# Notes on processing Sentinel-1 images using s1denoise

To denoise image
`$ python -m s1denoise.scripts.s1_correction INPUTFILE.zip OUTPUT.tif`

Generates a tif containing HH and HV bands with ground control points in WGS84

## Update GCPs

import rasterio

denoised_ds = rasterio.open('denoised_sar_data.tif')

Read updated gcps from another file

for gcp, x, y in zip(denoised_ds.gcps, lon, lat):
    gcp.x = x
    gcp.y = y

denoised_ds.write()


## Proposed Workflow
- denoise image -> GeoTIFF
- Apply mask [here or within denoising] - EE use OpenStreetMap
- use SNAP to get restituted gcps
- update gcps in GeoTIFF
- Reproject to Extreme Earth Polar Stereographic
- Create RGB to match EE