% ACC
subplot(2,4,1);
addpath('F:\code\NFRFS\COIL20');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end 
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315);  
set(gca, 'YTickLabelRotation', 45); 
%% 
subplot(2,4,2);
addpath('F:\code\NFRFS\ORL');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end 
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315);  
set(gca, 'YTickLabelRotation', 45); 
%% % ACC
subplot(2,4,3);
addpath('F:\code\NFRFS\JAFFE');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
 for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end 
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315);  
set(gca, 'YTickLabelRotation', 45);  
%% % ACC
subplot(2,4,4);
addpath('F:\code\NFRFS\ATT40');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end 
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315);  
set(gca, 'YTickLabelRotation', 45);  
%% % ACC
subplot(2,4,5);
addpath('F:\code\NFRFS\binalpha');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end 
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315);  
set(gca, 'YTickLabelRotation', 45); 
%% % ACC
subplot(2,4,6);
addpath('F:\code\NFRFS\lung_small');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315); 
set(gca, 'YTickLabelRotation', 45); 
%% % ACC
subplot(2,4,7);
addpath('F:\code\NFRFS\PCMAC');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end 
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315); 
set(gca, 'YTickLabelRotation', 45); 
%% % ACC
subplot(2,4,8);
addpath('F:\code\NFRFS\RELATHE');
alpha = [10^-6, 10^-4,10^-2,1,10^2,10^4,10^6];
results=[];
for al=alpha
    
        result_path = strcat('al=', num2str(al),',', 'be=', num2str(1), ',', 'gam=', num2str(1), ',', 'lam=', num2str(1),'_result.mat');
        load(result_path);
        results = [results,mtrResult(6,:)];
end 
results = reshape(results, 10,7);
xtick = {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'};
ytick = {'20', '40','60','80','100','120','140','160','180','200'};
bar3(results, 0.7)
set(gca, 'xtick', [1 2 3 4 5 6 7]);
set(gca, 'xticklabel', {'10^-6', '10^-4','10^-2','1','10^2','10^4','10^6'});
set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10]);
set(gca, 'yticklabel', {'20', '40','60','80','100','120','140','160','180','200'});
set(gca, 'FontSize', 1)
set(gca, 'XTickLabelRotation', 315);  
set(gca, 'YTickLabelRotation', 45);  
subplot_titles = {'(a) COIL20', '(b) ORL', '(c) JAFFE', '(d) ATT40', ...
                  '(e) binalpha', '(f) lung_small',  '(j) PCMAC', '(h) RELATHE'};
for i = 1:length(subplot_titles)
    subplot(2,4,i);
     hXLabel = xlabel('\alpha', 'FontSize', 3, 'FontName', 'Times New Roman');
    hYLabel = ylabel('selected features', 'FontSize', 3, 'FontName', 'Times New Roman');
    hZLabel = zlabel('ACC', 'FontSize', 3, 'FontName', 'Times New Roman');
    set(hXLabel, 'Rotation', 45);        
    set(hYLabel, 'Rotation', 325);         
    labelPosition = get(hYLabel, 'Position');
    newYPosition = labelPosition(2) + 0.03;
    set(hYLabel, 'Position', [labelPosition(1), newYPosition, labelPosition(3)]);
    title_text = subplot_titles{i};
    if contains(title_text, '_')
        title_text = strrep(title_text, '_', '\_');  
    end
    text(0.5, -0.2, title_text, 'Units', 'Normalized', ...
         'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', ...
         'FontName', 'Times New Roman', 'FontSize', 9);  
end