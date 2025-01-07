clc;clear;close all
x_num1=22;y_num1=8;
rec_num=35;
src_num1=x_num1*y_num1;
da1=load("multi_test_mod_f1.txt");
A1=da1(:,1);
t1=da1(:,2);
d1=da1(:,3);
% t1(A1==0)=0;
da1=load("multi_inv_mod_f1.txt");
A_init1=da1(:,1);
t_init1=da1(:,2);
d_init1=da1(:,3);
% t_init1(A_init1<0.1)=0;

x_num2=14;y_num2=6;
src_num2=x_num2*y_num2;
da2=load("multi_test_mod_f2.txt");
A2=da2(:,1);
t2=da2(:,2);
d2=da2(:,3);
% t2(A2==0)=0;
da2=load("multi_inv_mod_f2.txt");
A_init2=da2(:,1);
t_init2=da2(:,2);
d_init2=da2(:,3);
% t_init2(A_init2<0.1)=0;


fs=13;
load c1.mat
load c3.mat
%subfigure a--------------------------------------------------------------
a1=reshape(A1,[x_num1,y_num1]);
a1=fliplr(a1);
a2=reshape(A2,[x_num2,y_num2]);
a2=fliplr(a2);
figure
subplot(2,1,1)
colormap(c3)
imagesc(a1');
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num1+0.5])
ylim([0.5 y_num1+0.5])
clim([0 10]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
xlabel("Distance along strike of Fault-1 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
sub_fault_mid=zeros(src_num1,2);
sub_fault_length=zeros(src_num1,2);
k=1;
for i=1:y_num1
    for j=1:x_num1
    sub_fault_mid(k,1)=j;
    sub_fault_mid(k,2)=y_num1-i+1;
    sub_fault_length(k,1)=A1(k)*cos(d1(k)*pi/180);
    sub_fault_length(k,2)=-A1(k)*sin(d1(k)*pi/180);
    k=k+1;
    end
end
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(2);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)
hold on
quiver(sub_fault_mid(:,1),sub_fault_mid(:,2),sub_fault_length(:,1),sub_fault_length(:,2),0.8,'k')

subplot(2,1,2)
colormap(c3)
imagesc(a2')
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num2+0.5])
ylim([0.5 y_num2+0.5])
pbaspect([1 1 1]);
clim([0 10]);
ax = gca; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0.5:1.4:14.5;
% xlabel("Distance along strike of Fault-2 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial','Position',[8.657486990680846,8.084094456978676,1])
xticks([0.5,7.5, 14.5]);
xticklabels({'0','35','70'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.5887,5.1995]);
yticklabels({'10','20'});
sub_fault_mid=zeros(src_num2,2);
sub_fault_length=zeros(src_num2,2);
k=1;
for i=1:y_num2
    for j=1:x_num2
    sub_fault_mid(k,1)=j;
    sub_fault_mid(k,2)=y_num2-i+1;
    sub_fault_length(k,1)=A2(k)*cos(d2(k)*pi/180);
    sub_fault_length(k,2)=-A2(k)*sin(d2(k)*pi/180);
    k=k+1;
    end
end
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(1);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)
hold on
quiver(sub_fault_mid(:,1),sub_fault_mid(:,2),sub_fault_length(:,1),sub_fault_length(:,2),0.8*70/110,'k')
set(gca, 'Position', [0.215178571428571,0.307993197278912,0.452678571428571,0.258673469387755]); 
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod2_a1.png', 'Resolution', 900);

%subfigure b--------------------------------------------------------------
a1=reshape(A_init1,[x_num1,y_num1]);
a1=fliplr(a1);
a2=reshape(A_init2,[x_num2,y_num2]);
a2=fliplr(a2);
figure
subplot(2,1,1)
colormap(c3)
imagesc(a1');
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num1+0.5])
ylim([0.5 y_num1+0.5])
clim([0 10]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0.5:1:22.5;
% xlabel("Distance along strike of Fault-1 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
sub_fault_mid=zeros(src_num1,2);
sub_fault_length=zeros(src_num1,2);
k=1;
for i=1:y_num1
    for j=1:x_num1
    sub_fault_mid(k,1)=j;
    sub_fault_mid(k,2)=y_num1-i+1;
    sub_fault_length(k,1)=A_init1(k)*cos(d_init1(k)*pi/180);
    sub_fault_length(k,2)=-A_init1(k)*sin(d_init1(k)*pi/180);
    k=k+1;
    end
end
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(2);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)
hold on
quiver(sub_fault_mid(:,1),sub_fault_mid(:,2),sub_fault_length(:,1),sub_fault_length(:,2),0.8,'k')

subplot(2,1,2)
colormap(c3)
imagesc(a2')
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num2+0.5])
ylim([0.5 y_num2+0.5])
pbaspect([1 1 1]);
clim([0 10]);
ax = gca; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0.5:1.4:14.5;
xlabel("Distance along strike of Fault-2 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial','Position',[8.657486990680846,8.084094456978676,1])
xticks([0.5,7.5, 14.5]);
xticklabels({'0','35','70'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.5887,5.1995]);
yticklabels({'10','20'});
c = colorbar;
c.Location='southoutside';
% c.Title.Rotation = -90;
c.Title.String = 'Strength coefficient';
c.Title.FontSize = fs;
c.Title.FontWeight = 'bold';
c.Position = [0.217857142857143,0.121428571428572,0.601785714285714,0.03853471120346];
c.Title.Position=[129.0000000000001,-32.831565970910255,0];
sub_fault_mid=zeros(src_num2,2);
sub_fault_length=zeros(src_num2,2);
k=1;
for i=1:y_num2
    for j=1:x_num2
    sub_fault_mid(k,1)=j;
    sub_fault_mid(k,2)=y_num2-i+1;
    sub_fault_length(k,1)=A_init2(k)*cos(d_init2(k)*pi/180);
    sub_fault_length(k,2)=-A_init2(k)*sin(d_init2(k)*pi/180);
    k=k+1;
    end
end
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(1);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)
hold on
quiver(sub_fault_mid(:,1),sub_fault_mid(:,2),sub_fault_length(:,1),sub_fault_length(:,2),0.8*70/110,'k')
set(gca, 'Position', [0.215178571428571,0.307993197278912,0.452678571428571,0.258673469387755]); 
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod2_a2.png', 'Resolution', 900);

%subfigure c--------------------------------------------------------------
a1=reshape(t1,[x_num1,y_num1]);
a1=fliplr(a1);
a2=reshape(t2,[x_num2,y_num2]);
a2=fliplr(a2);
figure
subplot(2,1,1)
colormap(c1)
imagesc(a1');
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num1+0.5])
ylim([0.5 y_num1+0.5])
clim([0 130]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
xlabel("Distance along strike of Fault-1 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(2);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)


subplot(2,1,2)
colormap(c1)
imagesc(a2')
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num2+0.5])
ylim([0.5 y_num2+0.5])
pbaspect([1 1 1]);
clim([0 130]);
ax = gca; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0.5:1.4:14.5;
xlabel("Distance along strike of Fault-2 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial','Position',[8.657486990680846,8.084094456978676,1])
xticks([0.5,7.5, 14.5]);
xticklabels({'0','35','70'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.5887,5.1995]);
yticklabels({'10','20'});
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(1);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)
set(gca, 'Position', [0.215178571428571,0.307993197278912,0.452678571428571,0.258673469387755]); 
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod2_t1.png', 'Resolution', 900);

%subfigure d--------------------------------------------------------------
a1=reshape(t_init1,[x_num1,y_num1]);
a1=fliplr(a1);
a2=reshape(t_init2,[x_num2,y_num2]);
a2=fliplr(a2);
figure
subplot(2,1,1)
colormap(c1)
imagesc(a1');
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num1+0.5])
ylim([0.5 y_num1+0.5])
clim([0 130]);
ax = gca; 
ax.XAxisLocation = 'top'; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0.5:1:22.5;
xlabel("Distance along strike of Fault-1 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
xticks([0.5,5.5, 10.5, 15.5, 20.5]);
xticklabels({'0','25', '50', '75', '100'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.3475,4.6569,6.9663]);
yticklabels({'10','20','30'});
c = colorbar;
c.Location='southoutside';
c.Title.String = 'Time difference (s)';
c.Title.FontSize = fs;
c.Title.FontWeight = 'bold';
c.Position = [0.217857142857143,0.121428571428572,0.601785714285714,0.03853471120346];
c.Title.Position=[129.0000000000001,-32.831565970910255,0];
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(2);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)

subplot(2,1,2)
colormap(c1)
imagesc(a2')
set(gca,'TickDir','out')
axis equal
xlim([0.5 x_num2+0.5])
ylim([0.5 y_num2+0.5])
pbaspect([1 1 1]);
clim([0 130]);
ax = gca; 
ax.FontSize=fs;
ax.FontName='Arial';
ax.FontWeight="bold";
ax.XAxis.MinorTick = 'on';
ax.YAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = 0.5:1.4:14.5;
xlabel("Distance along strike of Fault-2 (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial','Position',[8.657486990680846,8.084094456978676,1])
xticks([0.5,7.5, 14.5]);
xticklabels({'0','35','70'});
ylabel("Depth (km)",'FontSize',fs,"fontweight",'bold','FontName','Arial')
yticks([2.5887,5.1995]);
yticklabels({'10','20'});
hold on
set(gca, 'box', 'off');
XL = get(gca,'xlim'); XR = XL(2);
YL = get(gca,'ylim'); YT = YL(1);
plot(XL,YT*ones(size(XL)),'k','linewidth',0.5)
hold on
plot(XR*ones(size(YL)),YL,'k','linewidth',0.5)
set(gca, 'Position', [0.215178571428571,0.307993197278912,0.452678571428571,0.258673469387755]); 
% exportgraphics(gcf, 'C:\Users\yuqinhua\Desktop\反演绘图\pic\mod2_t2.png', 'Resolution', 900);


% b_init=load("sph_1_result/field_true.field");
% b_fed=load("sph_1_result/step900.field");
% for i=1:rec_num
%     figure
%     subplot(3,1,1)
%     plot(t_all,b_init(:,1+3*(i-1)),t_all,b_fed(:,1+3*(i-1)))
%     subplot(3,1,2)
%     plot(t_all,b_init(:,2+3*(i-1)),t_all,b_fed(:,2+3*(i-1)))
%     subplot(3,1,3)
%     plot(t_all,b_init(:,3*i),t_all,b_fed(:,3*i))
% end

function b_fed=interp_2d(fed,t,A,d,t_all,t_sgl)
b_fed=zeros(length(t_all),size(fed,2));
for i=1:size(fed,3)
    x=t(i)+t_sgl;
    y=1:size(fed,2);
    F = griddedInterpolant({x,y},fed(:,:,i,d(i)));
    xq=t_all;
    yq=y;
    vq = F({xq,yq});
    vq(t_all<t(i),:)=0;
    vq(t_all>t(i)+t_sgl(end),:)=0;
    b_fed=b_fed+A(i)*vq;
end
end

