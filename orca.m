clear all;
hold off;
close all;
a=-5;
b=4;
r=2;
robots[]
%%%%%%%%%%%%%%%%%%the above parameters are the x and y coordinates and v_pref is calculated ,,, and v_opt_bis communicatesd by the other bots....v_opt_a is assumed to be same as v_pref
for i=1:size(robots,1)
c=[a^2-r^2,-2*a*b,b^2-r^2];
m=roots(c);	


x_tan=(a+m*b)./(1+m.^2);
y_tan=m.*x_tan;
if(a>0)
th=astan(atan2((y_tan-b),(x_tan-a)));
else
th=atan2((y_tan-b),(x_tan-a));	
end

theta=linspace(th(1),th(2),100);
x_cir=r*cos(theta)+a;
y_cir=r*sin(theta)+b;
%plot(x_cir,y_cir);


if (a<0)
		x_lin=linspace(x_tan(1),-20,1000);

		x_lin1=linspace(x_tan(2),-20,1000);

	else
		x_lin=linspace(x_tan(1),20,1000);

		x_lin1=linspace(x_tan(2),20,1000);

endif

y_lin=m(1).*x_lin;
y_lin1=m(2).*x_lin1;


%plot(x_lin,y_lin);hold on;plot(x_lin1,y_lin1);
%plot(x_cir,y_cir);
v=[x_cir',y_cir'];
v1=[x_lin',y_lin'];size(v1);
v2=[x_lin1',y_lin1'];
V=[v1;v];
V=[V;v2];

# define the opt velocity of the bots a=va_opt-vb
v_diff_opt=[4.6,-3.3];
for i=1:size(V,1)
p(i)=norm(V(i,:)-a);
end
min_dis=argmin(p);
u=V(min_dis,:)-v_diff_opt;



%plot(V(:,1),V(:,2));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
v_x=linspace(-20,20,500);
v_y=linspace(-20,20,500);
[x,y]=meshgrid(v_x,v_y);
A(:,:,1)=x;

A(:,:,2)=y;
%u=[-2,-3]
v_opt_a=[6,7]
v_pref=[2,2];
for i=1:size(A,1)
	for j=1:size(A,2)
		A(i,j,1);
		a(1)=ans;
		A(i,j,2);
		a(2)=ans;
		in(i,j)=dot((a-(v_opt_a+1/2*u)),u/norm(u))>0;
	end
end

k=1
for i=1:size(in,1)
	for j=1:size(in,2)
		if(in(i,j)~=0)
			x_fin(k)=A(i,j,1);
			y_fin(k)=A(i,j,2);
			k=k+1;
		endif
	end
end
disp('hey... ');
v[:,:,i]=[x_fin',y_fin'];
plot(x_fin,y_fin);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%found the ocra above.........this part marks the beginning of the last part i.e. linear programming
end

%%%%%%intersection of the sets
%index_new= argmin(norm(v-v_pref));
q=intersect(v(:,:,1),v(:,:,2));
for i=3:size(robot,1)
q=intersect(q,v(:,:,i))
end


for i=1:size(v,1)
p(i)=norm(v(i,:)-v_pref);
end

index_new=argmin(p);
va_new=v(index_new,:);
































