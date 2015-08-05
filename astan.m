function y=astan(x)
for i=1:size(x)
if(x(i)<0)
y(i)=2*pi+x(i);
else 
y(i)=x(i);
endif
end
end 