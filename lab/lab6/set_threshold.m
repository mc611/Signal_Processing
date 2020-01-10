
function new_data = set_threshold(original_data, threshold)
new_data = original_data;
a=find(abs(original_data(1,:))<threshold);
new_data(1,a)=0;
b=find(abs(original_data(1,:))>=threshold);
new_data(1,b)=1;
end


