function plotstructure(node,element)

figure('color','w')
hold on
axis vis3d
xlabel('asse x')
ylabel('asse y')
zlabel('asse z')

for i=1:length(element)
    
    ni=element(i).connections(1);
    nf=element(i).connections(2);
    xyz(:,1)=node(ni).xyz;
    xyz(:,2)=node(nf).xyz;
    
    plot3(xyz(1,:),xyz(2,:),xyz(3,:),'k-');
                   
end

end