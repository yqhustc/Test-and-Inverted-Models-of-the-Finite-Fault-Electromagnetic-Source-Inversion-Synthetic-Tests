clc;clear;close all
x_num=22;y_num=8;
src_num=x_num*y_num;
rec_num=35;

da=load("single_test_mod.txt");
grid=[y_num,x_num];
A=da(:,1);
t=da(:,2);
d=da(:,3);
t(find(A==0))=0;


da=load("single_inv_mod_1.txt");
A_init=da(:,1);
t_init=da(:,2);
d_init=da(:,3);
t_init(find(A_init<0.1))=0;
A_init(find(A_init<0.1))=0;

da=load("single_inv_mod_2.txt");
A_init1=da(:,1)';
t_init1=da(:,2)';
d_init1=da(:,3);
t_init1(find(A_init1<0.1))=0;
A_init1(find(A_init1<0.1))=0;



fs=16;
load c3.mat
load c1.mat
a1=reshape(A_init1,[x_num,y_num]);
a1=fliplr(a1);
figure
colormap(c3)
imagesc(a1')
set(gca,'TickDir','out')
axis equal
ylim([0.5 y_num+0.5])
clim([0 10]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
% xlabel("Distance along strike (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
c = colorbar;
c.Location="southoutside";
c.Title.String = 'Strength coefficient';
c.Title.FontSize = fs;
c.Title.FontWeight = 'bold';
c.Title.Position = [c.Title.Position(1)+160, c.Title.Position(2)-45 , c.Title.Position(3)];
k=1;
for i=1:y_num
    for j=1:x_num
    sub_fault_mid(k,1)=j;
    sub_fault_mid(k,2)=y_num-i+1;
    sub_fault_length(k,1)=A_init1(k)*cos(d_init1(k)*pi/180);
    sub_fault_length(k,2)=-A_init1(k)*sin(d_init1(k)*pi/180);
    k=k+1;
    end
end
hold on
quiver(sub_fault_mid(:,1),sub_fault_mid(:,2),sub_fault_length(:,1),sub_fault_length(:,2),0.8,'k')
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod1_a3.png', 'Resolution', 900);

a1=reshape(A_init,[x_num,y_num]);
a1=fliplr(a1);
figure
colormap(c3)
imagesc(a1')
set(gca,'TickDir','out')
axis equal
ylim([0.5 y_num+0.5])
clim([0 10]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
% xlabel("Distance along strike (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
k=1;
for i=1:y_num
    for j=1:x_num
    sub_fault_mid(k,1)=j;
    sub_fault_mid(k,2)=y_num-i+1;
    sub_fault_length(k,1)=A_init(k)*cos(d_init(k)*pi/180);
    sub_fault_length(k,2)=-A_init(k)*sin(d_init(k)*pi/180);
    k=k+1;
    end
end
hold on
quiver(sub_fault_mid(:,1),sub_fault_mid(:,2),sub_fault_length(:,1),sub_fault_length(:,2),0.8,'k')
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod1_a1.png', 'Resolution', 900);

a2=reshape(A,[x_num,y_num]);
a2=fliplr(a2);
figure
colormap(c3)
imagesc(a2')
set(gca,'TickDir','out')
axis equal
ylim([0.5 y_num+0.5])
clim([0 10]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
xlabel("Distance along the strike of Fault-1 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
k=1;
for i=1:y_num
    for j=1:x_num
    sub_fault_mid(k,1)=j;
    sub_fault_mid(k,2)=y_num-i+1;
    sub_fault_length(k,1)=A(k)*cos(d(k)*pi/180);
    sub_fault_length(k,2)=-A(k)*sin(d(k)*pi/180);
    k=k+1;
    end
end
hold on
quiver(sub_fault_mid(:,1),sub_fault_mid(:,2),sub_fault_length(:,1),sub_fault_length(:,2),0.8,'k')
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod1_a2.png', 'Resolution', 900);

a1=reshape(t_init1,[x_num,y_num]);
a1=fliplr(a1);
% a1(11:14,:)=a1(12:15,:);
figure
colormap(c1)
imagesc(a1')
set(gca,'TickDir','out')
axis equal
ylim([0.5 y_num+0.5])
clim([0 200]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
% xlabel("Distance along strike (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
c = colorbar;
c.Location="southoutside";
c.Title.String = 'Time difference (s)';
c.Title.FontSize = fs;
c.Title.FontWeight = 'bold';
c.Title.Position = [c.Title.Position(1)+160, c.Title.Position(2)-45 , c.Title.Position(3)];
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod1_t3.png', 'Resolution', 900);

a1=reshape(t_init,[x_num,y_num]);
a1=fliplr(a1);
figure
colormap(c1)
imagesc(a1')
set(gca,'TickDir','out')
axis equal
ylim([0.5 y_num+0.5])
clim([0 200]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
% xlabel("Distance along strike (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod1_t1.png', 'Resolution', 900);

a2=reshape(t,[x_num,y_num]);
a2=fliplr(a2);
figure
colormap(c1)
imagesc(a2')
set(gca,'TickDir','out')
axis equal
ylim([0.5 y_num+0.5])
clim([0 200]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
xlabel("Distance along the strike of Fault-1 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod1_t2.png', 'Resolution', 900);

