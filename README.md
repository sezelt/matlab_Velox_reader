# MATLAB Importer for FEI Velox Images
Import image data from FEI Velox EMD files to MATLAB

## Usage
```matlab
[image] = getDetectorFromVeloxEMD(fpath,detector)
```
`fpath` is a path to the Velox EMD file.
`detector` is the name of the detector to read the image from. If the specified detector is not found, all the available channels will be listed to the console. 

No other metadata is written.
