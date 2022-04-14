function [option_num,option_len12,option_len81,option_len55] = dhcp_analys(dhcp_data)

offset = 282;
len = length(dhcp_data);
num = 1;

for i=offset+1:len
    data = dhcp_data(i,1);
    if data == 255
        num = num;
        break;
    else
        num = num + 1;
        continue;
    end
end

option_data = dhcp_data([offset+1:offset+num-1],1);
option_list = [];
option_len = [];

k=1;
count = 0;
option_len12 = 0;
option_len81 = 0;
option_len55 = 0;

while k<num
    
    count = count + 1;
    
    option_list(count,1) = option_data(k);
    option_len(count,1) = option_data(k+1);
    
    if option_list(count,1)==12
        option_len12 = option_len(count,1);
    else
    end
    
    if option_list(count,1)==81
        option_len81 = option_len(count,1);
    else
    end
    
    if option_list(count,1)==55
        option_len55 = option_len(count,1);
    else
    end
    
    k = k + option_len(count,1) + 2;
    
end

option_num = count;







end