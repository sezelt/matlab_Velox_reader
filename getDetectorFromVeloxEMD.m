function [image] = getDetectorFromVeloxEMD(fpath,detector)
% getDetectorFromVeloxEMD Extract image data from an FEI Velox file for a given detector
%
%     [image] = getDetectorFromVeloxEMD(fpath,detector)
%     fpath = path to the .emd file
%     
%     detector = name of the desired detector, i.e. 'HAADF', 'BF'
%     
%     Specifying a detector not present will cause an error and output a
%     list of all the available detectors in the file
%     
%     Only works on image data. Cannot extract spectra (use hyperspy for that).
%     
%     2019, SE Zeltmann, steven.zeltmann@lbl.gov
%     Based in part on hyperspy's EMD reader. Thanks, hyperspy!

hinfo = h5info(fpath,'/Data/Image');

detectors = cell(length(hinfo.Groups),1);

for i = 1:length(hinfo.Groups)    
    meta = h5read(fpath,strcat(hinfo.Groups(i).Name, '/Metadata'));
    
    metadecode = native2unicode(meta);
    metadecode(metadecode==0) = [];
    
    metajson = jsondecode(metadecode);
    
    detectors{i} = metajson.BinaryResult.Detector;
    
    if strcmp(metajson.BinaryResult.Detector, detector)
        % we found the image we want! return it
        image = squeeze(h5read(fpath,strcat(hinfo.Groups(i).Name, '/Data')));
        return
    end
    
end

% we didn't find a matching image!
warning('No image matching specified detector found');

disp('Found the following detectors:');
for i=1:length(detectors)
    disp(detectors{i})
end

image = 0;

end