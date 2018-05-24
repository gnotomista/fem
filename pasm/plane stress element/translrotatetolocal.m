function x=translrotatetolocal(X)

G=1/4*[X(1,1)+X(2,1)+X(3,1)+X(4,1);
       X(1,2)+X(2,2)+X(3,2)+X(4,2);
       X(1,3)+X(2,3)+X(3,3)+X(4,3)];

x_G(:,1)=X(:,1)-G(1)*ones(4,1);
x_G(:,2)=X(:,2)-G(2)*ones(4,1);
x_G(:,3)=X(:,3)-G(3)*ones(4,1);

R=rotation_matrix(X);

x=x_G*R;

end