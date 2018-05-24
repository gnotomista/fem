function fu=ULS(concrete,steel,f0,elim,tol)


K=stiff(concrete,steel);

fd=f0(1,:)';
fl=f0(2,:)';

f=fd+fl;
ui=K\f;

l=1;
a=1;

uh=[0;0;0];
fr=[0;0;0];

err=abs(1-a)+norm(ui-uh)/norm(ui)+norm(f-fr)/norm(f);

cont=1;

while err>tol
    
    uh=ui;
    
    uit=K\f;
    
    a=alpha(uit,concrete,steel,elim);
    
    l=a*l;
    
    f=fd+l*fl;
    
    ui=a*uit;
    
    K=secstiff(concrete,steel,ui);
    
    fr=K*ui;
    
    cont=cont+1
    
    err=abs(1-a)+norm(ui-uh)/norm(ui)+norm(f-fr)/norm(f)
    
end

fu=fd+l*fl;


end