function [nom]=noms(nomnom,nomnomnom);[nomnomnomnom,nomnomnomnomnom] = size(nomnom);nomnomnomnomnomnom = mode(nomnomnom);nomnomnomnomnomnomnom = 0;nomnomnomnomnomnomnomnom = [];nomnomnomnomnomnomnomnomnom = [];nomnomnomnomnomnomnomnomnomnom = nomnomnomnomnomnom;nomnomnomnomnomnomnomnomnomnomnom = [];nomnomnomnomnomnomnomnomnomnomnom = [sum(nomnomnom==1) sum(nomnomnom==2)]/nomnomnomnom;nomnomnomnomnomnomnomnomnomnomnomnom = -sum(nomnomnomnomnomnomnomnomnomnomnom.*log0(nomnomnomnomnomnomnomnomnomnomnom));if any(nomnomnom ~= nomnomnom(1));for nomnomnomnomnomnomnomnomnomnomnomnomnom = 1:nomnomnomnomnom;nomnomnomnomnomnomnomnomnomnomnomnomnomnom = unique(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom));for nomnomnomnomnomnomnomnomnomnomnomnomnomnomnom = 1:length(nomnomnomnomnomnomnomnomnomnomnomnomnomnom);nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom = nomnomnomnomnomnomnomnomnomnomnomnomnomnom(nomnomnomnomnomnomnomnomnomnomnomnomnomnomnom);nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom = mode(nomnomnom(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) > nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom));nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom = mode(nomnomnom(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) <= nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom));nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom = nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom*ones(nomnomnomnom,1);nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) <= nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom) = nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom;nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom = [sum(nomnomnom(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) > nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom)==1) sum(nomnomnom(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) > nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom)==2)]/sum(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom)>nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom);nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom = [sum(nomnomnom(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) <= nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom)==1) sum(nomnomnom(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) <= nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom)==2)]/sum(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom)<=nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom);om = -sum(nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom.*log0(nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom));omnom = -sum(nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom.*log0(nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom));omnomnom = sum(nomnom(:,nomnomnomnomnomnomnomnomnomnomnomnomnom) > nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom)/nomnomnomnom;omnomnomnom = 1-omnomnom;omnomnomnomnom = nomnomnomnomnomnomnomnomnomnomnomnom - omnomnom*om - omnomnomnom*omnom;if omnomnomnomnom > nomnomnomnomnomnomnom;nomnomnomnomnomnomnom = omnomnomnomnom;nomnomnomnomnomnomnomnom = nomnomnomnomnomnomnomnomnomnomnomnomnom;nomnomnomnomnomnomnomnomnom = nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom;nomnomnomnomnomnomnomnomnomnom = nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom;nomnomnomnomnomnomnomnomnomnomnom = nomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnomnom;end;end;end;end;nom.splitVariable=nomnomnomnomnomnomnomnom;nom.splitValue=nomnomnomnomnomnomnomnomnom;nom.splitSat=nomnomnomnomnomnomnomnomnomnom;nom.splitNot=nomnomnomnomnomnomnomnomnomnomnom;nom.predict=@mnom;end
function [mn] = mnom(mnomnom,mnomnomnom);[mnomnomnomnom,mnomnomnomnomnom] = size(mnomnomnom);mnomnomnom = round(mnomnomnom);if isempty(mnomnom.splitVariable);mn = mnomnom.splitSat*ones(mnomnomnomnom,1);else;mn = zeros(mnomnomnomnom,1);;for mnomnomnomnomnom = 1:mnomnomnomnom;if mnomnomnom(mnomnomnomnomnom,mnomnom.splitVariable) > mnomnom.splitValue;mn(mnomnomnomnomnom,1) = mnomnom.splitSat;else;mn(mnomnomnomnomnom,1) = mnomnom.splitNot;end;end;end;end