clear all


CHIP = '4366c0';          % wifi chip (possible values 4339, 4358, 43455c0, 4366c0)
BW = 20;                % bandwidth

FILE1= './522.pcap';

NPKTS_MAX = 100000;       % max number of UDPs to process

fc=[-26:1:-4,4:1:26];
freq=fc*312500+2.412*10^9;

%% read file
HOFFSET = 16;           % header offset
NFFT = BW*3.2;          % fft size
p = readpcap();
p.open(FILE1);
n = min(length(p.all()),NPKTS_MAX);
p.from_start();
csi_buff = complex(zeros(n,NFFT),0);
k = 1;

while (k <= n)
    f = p.next();
    if isempty(f)
        disp('no more frames');
        break;
    end
    if f.header.orig_len-(HOFFSET-1)*4 ~= NFFT*4
        disp('skipped frame with incorrect size');
        continue;
    end
    payload = f.payload;
    H = payload(HOFFSET:HOFFSET+NFFT-1);
    if (strcmp(CHIP,'4339') || strcmp(CHIP,'43455c0'))
        Hout = typecast(H, 'int16');
    elseif (strcmp(CHIP,'4358'))
        Hout = unpack_float(int32(0), int32(NFFT), H);
    elseif (strcmp(CHIP,'4366c0'))
        Hout = unpack_float(int32(1), int32(NFFT), H);
    else
        disp('invalid CHIP');
        break;
    end
    Hout = reshape(Hout,2,[]).';
    cmplx = double(Hout([1:64],1))+1j*double(Hout([1:64],2));
    
    csi_buff_all(k,:) = cmplx.';

    k = k + 1;
end


for num=1:200
    csi_buff=csi_buff_all(((num-1)*1000+1):num*1000,:);
fitall={};
fitr=[];
difference_s_e=zeros(length(csi_buff),1);
max_phase=zeros(length(csi_buff),1);
min_phase=zeros(length(csi_buff),1);
csi_phase_all=zeros(length(csi_buff),46);
t=1;
[x,y]=size(csi_buff);
for point=2
    count=1;
    phase_set=[];
    
    for i=1:x
        csi1=csi_buff(i,:);
        csi = fftshift(csi1,2);
        csi_phase=angle(squeeze(csi));
            
        phase_line=csi_phase([7:29,37:59]);
        ph_line=unwrap(phase_line()); 
    end
end
end
