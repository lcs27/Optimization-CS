function x=get_exo3_solution(xbasic,ibasic)
x=[0,0,0,0];
for i=1:4
    index=find(ibasic==i);
    if size(index)==[1,1]
        x(i)=xbasic(index);
    else
        x(i)=0;
    end
end