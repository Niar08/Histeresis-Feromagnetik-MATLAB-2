data = readtable ("C:\Users\HP\Downloads\Tabel Histeresis Feromagnetik 2.xlsx", 'VariableNamingRule', 'preserve'); 

disp(data.Properties.VariableNames);

flux = data.("Magnetic Fluks");
current = data.("Current");

N = 500;
l = 1;
A = 4.5*4.5; 

%sumbu-y
B = flux/(N*A)
%sumbu-x
H = (N*current)/l

%kurva 
figure;
scatter(H, B, 'filled'); 
hold on;
plot(H, B, 'b-o', 'LineWidth', 0.3, 'MarkerSize', 2);
xlabel ('medan magnet, H ');
ylabel('induksi magnetik, B ');
title('kurva histeresis feromagnetik');
grid on

%Luas di bawah kurva 
luas_kurva = abs(trapz(H, B));
disp(['Luas di bawah kurva:', num2str(luas_kurva)])

%Eloss
V = A*l;
Eloss = luas_kurva*V;
disp(['Energi yang hilang (Eloss): ', num2str(Eloss), 'joule']);

% Menghitung ketidakpastian (standar deviasi)
combined_data = [H; B];
std_combined = std(combined_data);

disp(['ketidakpastian: ', num2str(std_combined)])