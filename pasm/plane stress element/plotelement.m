function plotelement(node,element,d,scale)

C=element.connections;

if strcmp(d,'undeformed')
    
    X=XYZ(node,C);
    X=[X;X(1,:)];
    plot3(X(:,1),X(:,2),X(:,3));
    
else
    
    D=XYZD(node,C,scale);
    D=[D;D(1,:)];
    plot3(D(:,1),D(:,2),D(:,3),':r');
    
end

end