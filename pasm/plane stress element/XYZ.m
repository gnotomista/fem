function X=XYZ(node,connections)

I=connections(1);
II=connections(2);
III=connections(3);
IV=connections(4);

X(1,:)=node(I).coordinates;
X(2,:)=node(II).coordinates;
X(3,:)=node(III).coordinates;
X(4,:)=node(IV).coordinates;

end