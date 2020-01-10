function number = count_spikes(data,setting)
b = find(data(1,:)==setting);
diffb = diff(b);
index = find(diffb~=1);
number = length(index)+1;
end 
