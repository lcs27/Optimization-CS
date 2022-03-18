function Boxes=ConvPlot(x_tilde,n)
%Process the post-treatment of solution
x=reshape(x_tilde,n,n);
Boxes=zeros(n,1);
for i=1:n
    Boxes(i)=find(x(:,i));
end
