clear all;
close all;
clc;

%% improved RPM
% parameters
%alpha_ref = 0.54;   % referece attenuation for phantom. 
%Fs = 20.00E6;         % sampling frequency

%TxFreq = 3.33;     %MHz, Transmission frequency
%depth = 150;       %mm.
%SoS = 1540;        %m/s
%window_sample_num =600;  %check this, this is one of the parameters which needs to be adjusted
%window_RF_line = 25;     %check this, this is one of the parameters which needs to be adjusted
%lf = 45;                 %check this, a good idea is too see the power spectrum before setting this value
%hf = 130;                  %optional, it should be always outside the 
%num_regression_point =5; 

[Data_0, ~] = ReadEscanData_modified('C:\Users\sjim\Dropbox (UNC Charlotte)\ACE_CIRS_NEW_PHANTOM_DATA\CIRS_Data_layered_and_BSC_july11_BCCh\New_Phantom_layered_liver_setting\rfData_acq0'); % reference phantom data 0.7 dB/cm/MHz
[Data_2, ~] = ReadEscanData_modified('C:\Users\sjim\Dropbox (UNC Charlotte)\ACE_CIRS_NEW_PHANTOM_DATA\CIRS_Data_layered_and_BSC_july11_BCCh\New_Phantom_layered_liver_setting\rfData_acq2'); % phantom data 0.5 dB/cm/MHz

[Data_1, ~] = ReadEscanData_modified('C:\Users\sjim\Dropbox (UNC Charlotte)\ACE_CIRS_NEW_PHANTOM_DATA\CIRS_Data_layered_and_BSC_july11_BCCh\New_Phantom_layered_liver_setting\rfData_acq1'); % reference phantom data 0.7 dB/cm/MHz
[Data_3, ~] = ReadEscanData_modified('C:\Users\sjim\Dropbox (UNC Charlotte)\ACE_CIRS_NEW_PHANTOM_DATA\CIRS_Data_layered_and_BSC_july11_BCCh\New_Phantom_layered_liver_setting\rfData_acq3'); % phantom data 0.5 dB/cm/MHz




Data_01 = Data_0(:,1:128,1:15);   %% 0.54
Data_02 = Data_0(:,1:128,16:30);    %% 0.54
Data_03 = Data_0(:,1:128,31:45);    %% 0.54

Data_21 = Data_2(:,1:128,1:15);    %% 0.54
Data_22 = Data_2(:,1:128,16:30);    %% 0.54
Data_23 = Data_2(:,1:128,31:45);    %% 0.54

Data_11 = Data_1(:,1:128,1:15);    %%1.30
Data_12 = Data_1(:,1:128,16:30);    %%1.30
Data_13 = Data_1(:,1:128,31:45);    %%1.30

Data_31 = Data_3(:,1:128,1:15);    %%1.30
Data_32 = Data_3(:,1:128,16:30);    %%1.30
Data_33 = Data_3(:,1:128,31:45);    %%1.30

%Data_pat = Data_pat1(:,1:128,1:15);

%Data_ref2 = Data_ref12(:,1:128,1:15);
%Data_pat2 = Data_pat12(:,1:128,1:15);

%figure
%plot(Data_ref(:,:,15));
%figure
%plot(Data_pat(:,:,15));
%figure
%plot(Data_ref2(:,:,15));
%figure
%plot(Data_pat2(:,:,15));

%writematrix(Data_ref, 'data_try1.csv');
%writematrix(Data_pat, 'data_try2.csv');
%writematrix(Data_ref12, 'data_try3.csv');
%writematrix(Data_pat12, 'data_try4.csv');

%P = readmatrix('data_try1.csv');

%% 
[Data_placenta, ~] = ReadEscanData_modified('C:\Users\sjim\Desktop\Kwave\New folder (2)\ACE_CIRS_NEW_PHANTOM_DATA (1)\CIRS_Data_layered_and_BSC_july11_BCCh\New_phantom_layered_placenta_setting\rfData_acq0'); % phantom data 0.5 dB/cm/MHz

%% dont run this 
D1 = reshape(Data_01, 1920,3870);
D2 = reshape(Data_02, 1920,3870);
D3 = reshape(Data_03, 1920,3870);
D4 = reshape(Data_21, 1920,3870);
D5 = reshape(Data_22, 1920,3870);
D6 = reshape(Data_23, 1920,3870);
D7 = reshape(Data_11, 1920,3870);
D8 = reshape(Data_12, 1920,3870);
D9 = reshape(Data_13, 1920,3870);
D10 = reshape(Data_31, 1920,3870);
D11 = reshape(Data_32, 1920,3870);
D12 = reshape(Data_33, 1920,3870);

Liver_Data = cat(1, D1, D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12);

%% 

%writematrix(Liver_Data, 'Liver_Data1.csv');
P = load('result_3.mat');
size(P)


%% 

D1 = permute(Data_01, [2,1,3]);
D2 = permute(Data_01, [2,1,3]);
D3 = permute(Data_01, [2,1,3]);
D4 = permute(Data_01, [2,1,3]);
D5 = permute(Data_01, [2,1,3]);
D6 = permute(Data_01, [2,1,3]);
D7 = permute(Data_01, [2,1,3]);
D8 = permute(Data_01, [2,1,3]);
D9 = permute(Data_01, [2,1,3]);
D10 = permute(Data_01, [2,1,3]);
D11 = permute(Data_01, [2,1,3]);
D12 = permute(Data_01, [2,1,3]);
%A1 = zeros(1920, 3870);
size(D12)

%% 
A1 = D1(:,:,1);
for i = 2:15
    A1 = cat(1, A1, D1(:,:,i));
end

A2 = D2(:,:,1);
for i = 2:15
    A2 = cat(1, A2, D2(:,:,i));
end

A3 = D3(:,:,1);
for i = 2:15
    A3 = cat(1, A3, D3(:,:,i));
end

A4 = D4(:,:,1);
for i = 2:15
    A4 = cat(1, A4, D4(:,:,i));
end

A4 = D4(:,:,1);
for i = 2:15
    A4 = cat(1, A4, D4(:,:,i));
end

A5 = D5(:,:,1);
for i = 2:15
    A5 = cat(1, A5, D5(:,:,i));
end

A6 = D6(:,:,1);
for i = 2:15
    A6 = cat(1, A6, D6(:,:,i));
end

A7 = D7(:,:,1);
for i = 2:15
    A7 = cat(1, A7, D7(:,:,i));
end

A8 = D8(:,:,1);
for i = 2:15
    A8 = cat(1, A8, D8(:,:,i));
end

A9 = D9(:,:,1);
for i = 2:15
    A9 = cat(1, A9, D9(:,:,i));
end

A10 = D1(:,:,1);
for i = 2:15
    A10 = cat(1, A10, D10(:,:,i));
end

A11 = D11(:,:,1);
for i = 2:15
    A11 = cat(1, A11, D11(:,:,i));
end

A12 = D12(:,:,1);
for i = 2:15
    A12 = cat(1, A12, D12(:,:,i));
end
%% 

A = cat(1, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12);

%% 

min1 = min(A, [], 2);
max1 = max(A, [], 2);
range = max1-min1;
B1 = A ./range;

%% 
range = max(A(:)) - min(A(:));
B = (A(:) - min(A(:))) / range;
%C = 2 * B - 1;  %%range for -1 to 1
plot(B(1,:));
%% 

writematrix(A, 'Liver_Data2_no_norm_att_try5.csv');
P = readmatrix('Liver_Data2_no_norm_att_try5.csv');
size(P)

%% 
%writematrix(C, 'Liver_Data2_single_att11.csv');
%P = readmatrix('normalized_data_new.csv');
%size(P)
P = P(1:3968, 1:2523);
size(P)
writematrix(P, 'test_new1.csv');

%% 
close;
plot(A(10,:));

%% % Create a sample 2D matrix A
%A = [1, 2, 3; 4, 5, 6; 7, 8, 9];

% Calculate the sum of each row and store it in a column vector
row_sums = sum(A, 2);


% Normalize each row of A by dividing each element by the corresponding row sum
normalized_A = A ./ row_sums;
size(normalized_A)

%% 

%writematrix(target_sequence, 'target_.csv');
%writematrix(test_sequence, 'test_.csv');

mse = mean((c - d).^2)*100;

MAE = mean(abs(c - d))*100;  %percent
MSE = mean(mean(mse, 2));
%plot(MSE)

%% LSTM


actual = a;
forecast = b;
mase = calc_mase(actual, forecast);
disp(mase);


function mase = calc_mase(actual, forecast)
    n = length(actual);
    d = mean(abs(diff(actual)));
    errors = abs(actual - forecast);
    mase = mean(errors)/d;
end

%% WaveNet

act = a;
fore = b;
mase = calc_mase(act, fore);
disp(mase);


function mase = calc_mase(actual, forecast)
    n = length(actual);
    d = mean(abs(diff(actual)));
    errors = abs(actual - forecast);
    mase = mean(errors)/d;
end

