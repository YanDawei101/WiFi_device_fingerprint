function [avg_traffic,max_traffic,min_traffic,var_traffic] = traffic(data_traffic)

    avg_traffic = 0;
    max_traffic = data_traffic(1,1);
    min_traffic = data_traffic(1,1);
    var_traffic = 0;
    
    data = unique(data_traffic);
    len = length(data);
    
    for i=1:len
        if data(i) > max_traffic
            max_traffic = data(i);
        else
        end
        
        if data(i) < max_traffic
            min_traffic = data(i);
        else
        end
       
    
    end
    
    avg_traffic = mean(data);
    var_traffic = std(data);
    
end
    

   
