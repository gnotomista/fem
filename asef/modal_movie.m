function modal_movie(nodo,trave,s_movie,q)
if q
    video = VideoWriter('modal#.avi');
    open(video);
end
figure('color','w')
hold on
axis vis3d
xlabel('asse x')
ylabel('asse y')
zlabel('asse z')
for t=1:length(trave)
    ni=trave(t).connessione(1);
    nf=trave(t).connessione(2);
    xyz(:,1)=nodo(ni).xyz;
    xyz(:,2)=nodo(nf).xyz;
    plot3(xyz(1,:),xyz(2,:),xyz(3,:));
    l=norm(xyz(:,2)-xyz(:,1));
    x3=(xyz(:,2)-xyz(:,1))/l;
    nsez=length(trave(t).M3);
    delta=l/(nsez-1);
    xyzs=zeros(3,nsez);
    drawDm=zeros(3,nsez);
    for sez=1:nsez
        xyzs(:,sez)=xyz(:,1)+delta*(sez-1)*x3;
        drawDm(:,sez)=xyzs(:,sez)+trave(t).spostamentimodali(1:3,sez)*s_movie;
    end
    plot3(drawDm(1,:),drawDm(2,:),drawDm(3,:),'g');
end
axis tight
set(gca,'nextplot','replacechildren');
frame=25;
for j = 1:frame
    close all
    figure
    view([1,1,1])
    hold on
    axis vis3d
    axis([-50 250 -50 250 -50 250])
    xlabel('asse x')
    ylabel('asse y')
    zlabel('asse z')
    for t=1:length(trave)
        ni=trave(t).connessione(1);
        nf=trave(t).connessione(2);
        xyz(:,1)=nodo(ni).xyz;
        xyz(:,2)=nodo(nf).xyz;
        plot3(xyz(1,:),xyz(2,:),xyz(3,:));
        l=norm(xyz(:,2)-xyz(:,1));
        x3=(xyz(:,2)-xyz(:,1))/l;
        nsez=length(trave(t).M3);
        delta=l/(nsez-1);
        xyzs=zeros(3,nsez);
        drawDm=zeros(3,nsez);
        for sez=1:nsez
            xyzs(:,sez)=xyz(:,1)+delta*(sez-1)*x3;
            drawDm(:,sez)=xyzs(:,sez)+sin(2*pi*(j-1)/(frame))*trave(t).spostamentimodali(1:3,sez)*s_movie;
        end
        plot3(drawDm(1,:),drawDm(2,:),drawDm(3,:),'g');
    end
    F(j) = getframe;
end
f=length(F);
t=10;%number of repetitions
for n=1:t-1
    F(n*frame+1:n*frame+f)=F(1:f);
end
if q
    writeVideo(video,F)
    close(video);
end
movie(F,100,frame);
end