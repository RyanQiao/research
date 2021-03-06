clear all; close all; clc;

% l(1) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu3_HL_2014-05-28_aa.mat');

%PD Controller

% l(5) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu3_4_HL_2014-05-28_aa.mat');
% l(4) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu3_3_HL_2014-05-28_aa.mat');
% l(3) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu3_2_HL_2014-05-28_aa.mat');
% l(2) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu3_1_HL_2014-05-28_aa.mat');

% l(1) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu6_HL_2014-05-28_aa.mat');
% l(4) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu6_3_HL_2014-05-28_aa.mat');
% l(3) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu6_2_HL_2014-05-28_aa.mat');
% l(2) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu6_1_HL_2014-05-28_aa.mat');

%l(1) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu7_HL_2014-05-28_aa.mat');
%l(3) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu7_2_HL_2014-05-28_aa.mat');
%l(2) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu7_1_HL_2014-05-28_aa.mat');

%  l(1) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu8_wholetrack_HL_2014-05-28_aa.mat');
%  l(4) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu8_wholetrack_3_HL_2014-05-28_aa.mat');
%  l(3) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu8_wholetrack_2_HL_2014-05-28_aa.mat');
%  l(2) = load('C:\Users\ddl\Documents\localTestData\2014 5 ILC\fullautomu8_wholetrack_1_HL_2014-05-28_aa.mat');

%_____________________________________________________________________________________________________________%

%LQR Controller

% l(4) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu3opt_3_HL_2014-07-17_aa.mat');
% l(3) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu3opt_2_HL_2014-07-17_aa.mat');
% l(2) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu3opt_1_HL_2014-07-17_aa.mat');
% l(1) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu3_HL_2014-07-17_aa.mat');

 l(1) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu8_HL_2014-07-17_aa.mat');
 l(4) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu8_opt3_HL_2014-07-17_aa.mat');
 l(3) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu8_opt2_HL_2014-07-17_aa.mat');
 l(2) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu8_opt1_HL_2014-07-17_aa.mat');

% l(3) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu7opt_2_HL_2014-07-17_aa.mat');
% l(2) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu7opt_1_HL_2014-07-17_aa.mat');
% l(1) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu7_HL_2014-07-17_aa.mat');

% l(1) = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\mu7baseline_2015-09-29_aa.mat');
% l(2) = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\mimo7lap1_2015-09-29_aa.mat');
% l(3) = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\mimo7lap2_2015-09-29_aa.mat');
% l(4) = load('C:\Users\ddl\Documents\localTestData\2015 09 30 Lap Time and MILC\mimo7lap3_2015-09-29_aa.mat');
% l(5) = load('C:\Users\ddl\Documents\localTestData\2014 7 ILC\mu8_opt4_HL_2014-07-17_aa.mat');


figure;
N = numel(l); sI = 50; sE = 1500;
c ={};
c(1) = {[1 0 0]};
c(2) = {[.502 .502 .502]};
c(3) = {[.8 .8 .8]};
c(4) = {[0 1 0]};
c(5) = {[1 0 1]};

subplot(2, 1, 1); grid on; hold on;
set(gca,'FontName','Arial','FontSize',12,'XTickLabel',[],'Position',[0.130 0.696 0.829 0.289])
ylabel('Lateral Error e (m)','FontName','Arial','FontSize',14)
xlim([sI sE]); ylim([-.3 .5])

legendStr = {};

for i = 1:N
    
    try
        s = l(i).mapMatch.s_m;
    catch
        s = l(i).mapMatch.s;
    end
    
    legendStr(i) = {['Lap ' num2str(i-1)]};
    ind1 = find(s > sI);
    ind2 = find(s < sE);
    ind = intersect(ind1, ind2);
    
    plot(s(ind), l(i).mapMatch.e(ind),'Color',cell2mat(c(i)),'LineWidth',2);
end

subplot(2, 1, 2); grid on; hold on;
set(gca,'FontName','Arial','FontSize',12,'Position',[0.125 0.356 0.823 0.318])
ylabel('Steering Correction \delta^L (deg)','FontName','Arial','FontSize',14)
xlim([sI sE]); ylim([-1 1])

for i = 1:N
    
    try
        s = l(i).mapMatch.s_m;
    catch
        s = l(i).mapMatch.s;
    end
    
    ind1 = find(s > sI);
    ind2 = find(s < sE);
    ind = intersect(ind1, ind2);
    
    plot(s(ind), l(i).HLsteering.deltaLearn(ind)*180/pi,'Color',cell2mat(c(i)),'LineWidth',2);
end
legend(legendStr);

xlim([sI sE]);
xlabel('Distance Along Path (m)','FontName','Arial','FontSize',14)


% subplot(3,1,3); grid on; hold on;
% set(gca,'FontName','Arial','FontSize',12,'Position',[0.1288 0.086 0.818 0.247])
% ylabel('FB + FFW Steering (deg)','FontName','Arial','FontSize',14)
% xlim([sI sE]); ylim([-3.5 5.5]);
% xlabel('Distance Along Path (m)','FontName','Arial','FontSize',14)
% 
% for i = 1:N
%     
%     try
%         s = l(i).mapMatch.s_m;
%     catch
%         s = l(i).mapMatch.s;
%     end
%     
%     ind1 = find(s > sI);
%     ind2 = find(s < sE);
%     ind = intersect(ind1, ind2);
%     
%     plot(s(ind), l(i).HLlongitudinal.Fx_N(ind)/1000,'Color',cell2mat(c(i)),'LineWidth',2);
% end

