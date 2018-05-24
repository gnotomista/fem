function R=rotation_matrix(X)

a=det([X(1,2) X(1,3) 1;X(2,2) X(2,3) 1;X(3,2) X(3,3) 1]);
b=-det([X(1,1) X(1,3) 1;X(2,1) X(2,3) 1;X(3,1) X(3,3) 1]);
c=det([X(1,1) X(1,2) 1;X(2,1) X(2,2) 1;X(3,1) X(3,2) 1]);

x=transltoG(X);

k=[a;b;c]/norm([a,b,c]);

i=((x(1,:)+x(4,:))/2)'/norm((x(1,:)+x(4,:))/2);

j=cross(k,i)/norm(cross(k,i));

R=[i,j,k];

end