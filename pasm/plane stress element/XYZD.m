function D=XYZD(node,connections,scale)

for f=1:length(node)
    
    node(f).deform_displ=node(f).coordinates+scale*node(f).displacement';
    
end

I=connections(1);
II=connections(2);
III=connections(3);
IV=connections(4);

D(1,:)=node(I).deform_displ;
D(2,:)=node(II).deform_displ;
D(3,:)=node(III).deform_displ;
D(4,:)=node(IV).deform_displ;

end