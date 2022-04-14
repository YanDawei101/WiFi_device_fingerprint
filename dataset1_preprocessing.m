%clear;
format long;
csilist={'data_moving.dat','csi2moving.dat'};

fc=[-28,-26,-24,-22,-20,-18,-16,-14,-12,-10,-8,-6,-4,-2,-1,...
    1,3,5,7,9,11,13,15,17,19,21,23,25,27,28];
band=312500;
freq=fc*band+2.412*10^9;
temp_y=zeros(1,30);
start=1;
for t=1:length(csilist)
fitr=[];
    csi_trace = read_bf_file(csilist{t});
    csi_trace(cellfun(@isempty,csi_trace))=[];    
csi_phase_all=zeros(length(csi_trace),30);
n=2;
% count=1;
ll(t)=length(csi_trace);
phi=[];time=[];
difference_s_e=zeros(length(csi_trace),1);
max_phase=zeros(length(csi_trace),1);
min_phase=zeros(length(csi_trace),1);
for point=2
    count=1;
    phase_set=[];
for i=start:length(csi_trace)
    csi_entry = csi_trace{i};

    csi=squeeze(get_scaled_csi(csi_entry));
    if csi_entry.Ntx>=2
        csi=squeeze(csi(1,:,:));
    end

    csi_phase=angle(csi);
    temp=(csi_phase(point,:));
    ph_line=unwrap(temp);
end
end