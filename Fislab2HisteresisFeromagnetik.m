

data = readtable ("C:\Users\HP\Downloads\Tabel Histeresis Feromagnetik 2.xlsx", 'VariableNamingRule', 'preserve'); 

disp(data.Properties.VariableNames);

flux = data.("Magnetic Fluks");
current = data.("Current");

if iscell(current)
    current = str2double(current);
end
if iscell(flux)
    flux = str2double(flux);
end

N = 500;
l = 0.01; %1 cm = 0.01 m
A = (4.5e-2)*(4.5e-2); %4.5 cm = 4.5e-2 m

H = (N*current)/l;
B = flux/A;

figure;
plot(H, B, 'b-o', 'LineWidth', 0.3, 'MarkerSize', 2);
xlabel ('medan magnet, H (A/m)');
ylabel('induksi magnetik, B (T)');
title('kurva histeresis feromagnetik');
grid on


