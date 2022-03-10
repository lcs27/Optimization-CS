function x=get_exo4_solution(xbasic,ibasic)
x=[0,0,0];
for i=1:3
    index=find(ibasic==i);
    if size(index)==[1,1]
        x(i)=xbasic(index);
    else
        x(i)=0;
    end
end