function calibrated=calibrateFDPM(cal,raw,range,fdpm)
% send in calibration factors and raw data and return calibrated data
% Output:
% calibrated.AC
% calibrated.phase
% calibrated.damp
% calibrated.dphi
% calibrated.freq
% calibrated.dist

raw.AC=raw.AC(fdpm.up:fdpm.down);
raw.phase=raw.phase(fdpm.up:fdpm.down);
calibrated.AC=raw.AC./cal.AC;
calibrated.phase=raw.phase-cal.phase;
% freq=raw.freq(fdpm.up:fdpm.down);
% phifit = polyfit(freq(1:20),calibrated.phase(1:20),2);
% phipoly = polyval(phifit,freq);  
% calibrated.phase = calibrated.phase-calibrated.phase(fdpm.up)+1; %Add 1 so that when calculating chi^2, we dont divide by 0
%calibrated.phase = calibrated.phase-calibrated.phase(1);
calibrated.phase = calibrated.phase-calibrated.phase(1)+1;
calibrated.damp = calibrated.AC.*sqrt((raw.ACsd(fdpm.up:fdpm.down)./raw.AC).^2 + cal.ACsd_AC_sqd);
calibrated.dphi = sqrt(cal.phsd_sqd + raw.phsd(fdpm.up:fdpm.down).^2);

calibrated.freq = raw.freq;

calibrated.dist = raw.dist;


