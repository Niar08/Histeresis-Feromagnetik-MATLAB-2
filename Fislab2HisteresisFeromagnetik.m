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
xlabel ('medan magnet, H ');
ylabel('induksi magnetik, B ');
title('kurva histeresis feromagnetik');
grid on

%Luas di bawah kurva 
H = H(~isnan(H));
B = B(~isnan(B));
luas_kurva = abs(trapz(H, B));
disp(['Luas di bawah kurva:', num2str(luas_kurva)])

%
V = A*l;
Eloss = luas_kurva*V;
disp(['Energi yang hilang (Eloss): ', num2str(Eloss), 'joule']);

% Menghitung ketidakpastian (standar deviasi)
combined_data = [H; B];
std_combined = std(combined_data);

disp(['ketidakpastian: ', num2str(std_combined)])