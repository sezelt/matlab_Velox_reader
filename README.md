# MATLAB Importer for FEI Velox Images
Import image data from FEI Velox EMD files to MATLAB

## Usage
```matlab
[image] = getDetectorFromVeloxEMD(fpath,detector)
```
`fpath` is a path to the Velox EMD file.


`detector` is the name of the detector to read the image from. If the specified detector is not found, all the available channels will be listed to the console. For example, `'HAADF'`.


No other metadata is read, and no more advanced datatypes are supported. I have only tested this on a few EMD's so large files with spectrum images may cause problems. Open an issue if that happens!

### Example
```matlab
image = getDetectorFromVeloxEMD('path-to-emd-file','HAADF');
```
will return the HAADF image in the file. Simple!
