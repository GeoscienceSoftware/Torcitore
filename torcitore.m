clear all; close all; clc;
% generate a tornado plot for sensitivity analysis

n=20; % number of variables

%generate random cell array of strings as names
s = 'abcdefghijklmnopqrstuvwxyz'; ns = length(s); varlen = 3;
for jj=1:n; names{jj,:} = [ 'Variable - ' s(ceil(rand(1,varlen)* ns))];end


% generate random data
temp1=rand([n 1]);
temp2=rand([n 1]);
base=max(temp1+temp2);
low=base-temp1;
high=base+temp2;
% sort
[lowsort, ind]=sort(low,'descend');
highsort=high(ind);
namesort=names(ind);
difference2=highsort-base;

% plot
figure('units','normalized','outerposition',[0 0 1 1])
h1 = barh(highsort,'r');
hold on;
barh(highsort-difference2,'b');
barh(lowsort,'w','EdgeColor','none','BarWidth',1);
hold on
set(gca,'Ytick',1:length(namesort),'YTickLabel',1:length(namesort));
xlim([min(lowsort)-0.1 max(highsort)+0.1])
set(gca,'yticklabel',namesort);
xlabel('Output Sensitivity','FontSize',20)
ylabel('Input Variables','FontSize',20)
title('Tornado Plot','FontSize',20)

