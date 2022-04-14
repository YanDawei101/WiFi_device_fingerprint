clear all;


device_name = 'xiaomi0848';
pathfile = 'xiaomi0848';
xlsfile = 'xiaomi0848';
file_len = 30;


TMP_PATH_dhcp = strcat('./CSI/devices_data/',pathfile,'/dhcp_data/');
TMP_PATH_analyzed = strcat('./CSI/devices_data/',pathfile,'/analyzed_data/');

feature_device_type = zeros (file_len,30);

for i=1:file_len
   
    DHCP_len = [];
    MDNS_len = [];
    LLMNR_len = [];
    SSDP_len = [];
    NBNS_len = [];
    
    num_MDNS = 0;
    num_LLMNR = 0;
    num_SSDP = 0;
    num_NBNS = 0;
    
    protocol = [];
    analyzed_data = readtable(strcat(TMP_PATH_analyzed,device_name,'_',num2str(i),'.csv'),'Format', '%s%s%s%s%s%s%s', 'Delimiter', ',');
    
    protocol_type = cellstr(char(analyzed_data{:,5}));
    protocol_len_set = str2num(char(analyzed_data{:,6}));

    len_cell = height(analyzed_data);
    
    protocol_type_set=[];
    num_DHCP = 0;
    count = 0;
    for j=1:len_cell
        if ~isempty(protocol_type{j})
            count = count+1;
            protocol_type_set{count,1} = protocol_type{j,1};
        else
        end
    end
    
    for j=1:count
        if ismember("""ARP""",protocol_type_set{j,1})
            feature_device_type(i,1) = 1;
        elseif ismember("ARP",protocol_type_set{j,1})
            feature_device_type(i,1) = 1;
        else 
        end
        
        if ismember("""DHCP""",protocol_type_set{j,1})
            feature_device_type(i,2) = 1;
            num_DHCP = num_DHCP + 1;
            DHCP_len(num_DHCP,1) = protocol_len_set(j,1);
        elseif ismember("DHCP",protocol_type_set{j,1})
            feature_device_type(i,2) = 1;
            num_DHCP = num_DHCP + 1;
            DHCP_len(num_DHCP,1) = protocol_len_set(j,1);
        else
        end
        
        if ismember("""IGMP""",protocol_type_set{j,1})
            feature_device_type(i,3) = 1;
        elseif ismember("IGMP",protocol_type_set{j,1})
            feature_device_type(i,3) = 1;
        else
        end
        
        if ismember("""ICMPv6""",protocol_type_set{j,1})
            feature_device_type(i,4) = 1;
        elseif ismember("ICMPv6",protocol_type_set{j,1})
            feature_device_type(i,4) = 1;
        else
        end
        
        if ismember("""UDP""",protocol_type_set{j,1})
            feature_device_type(i,5) = 1;
        elseif ismember("UDP",protocol_type_set{j,1})
            feature_device_type(i,5) = 1;
        else
        end
        
        if ismember("""TCP""",protocol_type_set{j,1})
            feature_device_type(i,6) = 1;
        elseif ismember("TCP",protocol_type_set{j,1})
            feature_device_type(i,6) = 1;
        else
        end
        
        if ismember("""MDNS""",protocol_type_set{j,1})
            feature_device_type(i,7) = 1;
            num_MDNS = num_MDNS+1;
            MDNS_len(num_MDNS,1) = protocol_len_set(j,1);
        elseif ismember("MDNS",protocol_type_set{j,1})
            feature_device_type(i,7) = 1;
            num_MDNS = num_MDNS+1;
            MDNS_len(num_MDNS,1) = protocol_len_set(j,1);
        else
        end
        
        if ismember("""LLMNR""",protocol_type_set{j,1})
            feature_device_type(i,8) = 1;
            num_LLMNR = num_LLMNR+1;
            LLMNR_len(num_LLMNR,1) = protocol_len_set(j,1);
        elseif ismember("LLMNR",protocol_type_set{j,1})
            feature_device_type(i,8) = 1;
            um_LLMNR = num_LLMNR+1;
            LLMNR_len(num_LLMNR,1) = protocol_len_set(j,1);
        else
        end
        
        if ismember("""SSDP""",protocol_type_set{j,1})
            feature_device_type(i,9) = 1;
            num_SSDP = num_SSDP+1;
            SSDP_len(num_SSDP,1) = protocol_len_set(j,1);
        elseif ismember("SSDP",protocol_type_set{j,1})
            feature_device_type(i,9) = 1;
            num_SSDP = num_SSDP+1;
            SSDP_len(num_SSDP,1) = protocol_len_set(j,1);
        else
        end
        
        if ismember("""NBNS""",protocol_type_set{j,1})
            feature_device_type(i,10) = 1;
            num_NBNS = num_NBNS+1;
            NBNS_len(num_NBNS,1) = protocol_len_set(j,1);
        elseif ismember("MDNS",protocol_type_set{j,1})
            feature_device_type(i,10) = 1;
            num_NBNS = num_NBNS+1;
            NBNS_len(num_NBNS,1) = protocol_len_set(j,1);
        else
        end
    end
    
    if ~isempty(MDNS_len)
        [avg_MDNS,max_MDNS,min_MDNS,var_MDNS] = traffic(MDNS_len);
        feature_device_type(i,[11:14]) = [avg_MDNS,max_MDNS,min_MDNS,var_MDNS];
    else
    end
    
    if ~isempty(LLMNR_len)
        [avg_LLMNR,max_LLMNR,min_LLMNR,var_LLMNR] = traffic(LLMNR_len);
        feature_device_type(i,[15:18]) = [avg_LLMNR,max_LLMNR,min_LLMNR,var_LLMNR];
    else
    end
    
    if ~isempty(SSDP_len)
        [avg_SSDP,max_SSDP,min_SSDP,var_SSDP] = traffic(SSDP_len);
        feature_device_type(i,[19:22]) = [avg_SSDP,max_SSDP,min_SSDP,var_SSDP];
    else
    end
    
    if ~isempty(NBNS_len)
        [avg_NBNS,max_NBNS,min_NBNS,var_NBNS] = traffic(NBNS_len);
        feature_device_type(i,[23:26]) = [avg_NBNS,max_NBNS,min_NBNS,var_NBNS];
    else
    end
    
   
    HOFFSET = DHCP_len;
    dhcp_data = strcat(TMP_PATH_dhcp,device_name,'_',num2str(i),'.pcap');
    fid = fopen(dhcp_data,'r'); 
    tmpPack = fread(fid,Inf,'uint8');
    
    Pack = tmpPack([25:length(tmpPack)],1);
    
    DHCP_data = [];

    k = 1;
    sum_DHCP_len_1 = 0;
    sum_DHCP_len_2 = 0;
    
    DHCP_len_max = max(DHCP_len);

    
    while k<=num_DHCP
        
         sum_DHCP_len_2 = sum_DHCP_len_2 + DHCP_len(k,1);
         DHCP_data= Pack([k*16+1+sum_DHCP_len_1:k*16+sum_DHCP_len_2],1);
         
         [option_num(k),option_len12(k),option_len81(k),option_len55(k)] = dhcp_analys(DHCP_data);
         
         sum_DHCP_len_1 = sum_DHCP_len_1 + DHCP_len(k,1);
         k = k+1;
         
    end

    option_num = mean(option_num);
    option_len12 = max(option_len12);
    option_len81 = max(option_len81);
    option_len55 = max(option_len55);
    
     feature_device_type(i,[27:30]) = [option_num,option_len12,option_len81,option_len55];

end

xlswrite(strcat('figureprint03/device_type/',xlsfile,'.xls'),feature_device_type);


