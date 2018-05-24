function plotstruttura(nodo,trave,diag,s)
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
    R=matriceriferimento(xyz(:,1),xyz(:,2),trave(t).riferimento);
    l=norm(xyz(:,2)-xyz(:,1));
    x3=(xyz(:,2)-xyz(:,1))/l;
    nsez=length(trave(t).M3);
    delta=l/(nsez-1);
    xyzs=zeros(3,nsez);
    Mf=zeros(3,nsez);
    drawMf=zeros(3,nsez);
    T=zeros(3,nsez);
    drawT=zeros(3,nsez);
    N=zeros(3,nsez);
    drawN=zeros(3,nsez);
    Mt=zeros(3,nsez);
    drawMt=zeros(3,nsez);
    drawD=zeros(3,nsez);
    drawDm=zeros(3,nsez);
    for sez=1:nsez
        xyzs(:,sez)=xyz(:,1)+delta*(sez-1)*x3;
        switch diag
            case 'Mf'
                Mf(:,sez)=R(1:3,1:3)'*[-trave(t).M2(sez);trave(t).M1(sez);0];
                drawMf(:,sez)=xyzs(:,sez)+Mf(:,sez)*s(1);
            case 'T'
                T(:,sez)=R(1:3,1:3)'*[trave(t).T1(sez);trave(t).T2(sez);0];
                drawT(:,sez)=xyzs(:,sez)+T(:,sez)*s(2);
            case 'N'
                N(:,sez)=R(1:3,1:3)'*[trave(t).N(sez);0;0];
                drawN(:,sez)=xyzs(:,sez)+N(:,sez)*s(2);
            case 'Mt'
                Mt(:,sez)=R(1:3,1:3)'*[trave(t).M3(sez);0;0];
                drawMt(:,sez)=xyzs(:,sez)+Mt(:,sez)*s(2);
            case 'D'
                drawD(:,sez)=xyzs(:,sez)+trave(t).spostamenti(1:3,sez)*s(3);
            case 'Dm'
                drawDm(:,sez)=xyzs(:,sez)+trave(t).spostamentimodali(1:3,sez)*s(3);
        end
    end
    switch diag
        case 'Mf'
            plot3(drawMf(1,:),drawMf(2,:),drawMf(3,:),'r');
        case 'T'
            plot3(drawT(1,:),drawT(2,:),drawT(3,:),'r');
        case 'N'
            plot3(drawN(1,:),drawN(2,:),drawN(3,:),'r');
        case 'Mt'
            plot3(drawMt(1,:),drawMt(2,:),drawMt(3,:),'r');
        case 'D'
            plot3(drawD(1,:),drawD(2,:),drawD(3,:),'g');
        case 'Dm'
            plot3(drawDm(1,:),drawDm(2,:),drawDm(3,:),'g');
    end
end
end