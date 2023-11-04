% Užkraunami visi reikalingi failai ir funkcijos
addpath('C:\Users\MSI\Desktop\IS-Lab4-master'); % Čia 'kelias/iki/funkcijos/' pakeiskite savo funkcijų direktorija

% Išvalomi kintamieji ir uždaromi visi atvaizdai
close all;
clear variables;
clc;

%% Mokymo duomenų paruošimas
% Čia nurodome mokymo duomenų vaizdo failo pavadinimą
pavadinimas_mokymui = 'train.jpg'; % Čia įrašykite savo mokymo duomenų failo pavadinimą
% Skaičių eilučių vaizde nustatymas
pvz_eiluciu_sk_mokymui = 1; % Čia įrašykite, kiek eilučių yra jūsų mokymo vaizde
% Požymių išskyrimas mokymo vaizdui
pozymiai_mokymui = pozymiai_raidems_atpazinti(pavadinimas_mokymui, pvz_eiluciu_sk_mokymui);

% Požymių ir teisingų atsakymų matricų paruošimas
P_mokymui = cell2mat(pozymiai_mokymui);
T_mokymui = eye(size(pozymiai_mokymui, 2)); % Čia prielaidos, kad simbolių skaičius ir tvarka atitinka 'eye' matricą

%% RBFN tinklo mokymas
% Neuronų skaičiaus sumažinimas
neuronu_sk = 10; % Čia galite pasirinkti mažesnį skaičių nei 13
% RBFN tinklo kūrimas
tinklas = newrb(P_mokymui, T_mokymui, 0, 1, neuronu_sk);

%% Tinklo testavimas su naujais duomenimis
% Testavimo duomenų vaizdo failo pavadinimas
pavadinimas_testavimui = 'train.jpg'; % Čia įrašykite savo testavimo duomenų failo pavadinimą
% Skaičių eilučių vaizde nustatymas testavimui
pvz_eiluciu_sk_testavimui = 1; % Čia įrašykite, kiek eilučių yra jūsų testavimo vaizde
% Požymių išskyrimas testavimo vaizdui
pozymiai_testavimui = pozymiai_raidems_atpazinti(pavadinimas_testavimui, pvz_eiluciu_sk_testavimui);

% Požymių matricos paruošimas testavimui
P_testavimui = cell2mat(pozymiai_testavimui);
% Tinklo išvesties apskaičiavimas
Y_testavimui = sim(tinklas, P_testavimui);

% Atpažintų simbolių nustatymas
[~, atpazinti_indeksai] = max(Y_testavimui);
% Rezultatų atvaizdavimas
disp('Atpažinti simboliai:');
disp(atpazinti_indeksai);

% Čia galite pridėti papildomą kodą, kuris atvaizduotų atpažintus simbolius
% ...
% Toliau eina po kodą, skirtą tinklo testavimui

% Atpažintų simbolių atvaizdavimas tekstine forma





% ...

%% Atpažintų simbolių atvaizdavimas tekstine forma
% Sukuriamas simbolių žodynas, kuris atitinka mokymo duomenis
% Tarkime, kad turime skaičius nuo 0 iki 9, papildome raides, jei reikia
simboliu_zodynas = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C'];

% Inicializuojame atsakymo eilutę
atsakymas = '';

% Vertiname tinklo išvestį ir sudarome atpažintų simbolių eilutę
a=length(atpazinti_indeksai);


% Išvedame atpažintus simbolius į MATLAB komandinį langą
fprintf('Atpažinti simboliai: %s\n', simboliu_zodynas(atpazinti_indeksai(1)));

% Jei norite atvaizduoti atpažintus simbolius grafiškai, naudokite kodą, aprašytą ankstesniame pranešime
