%Gera um struct S com matrizes que representam as avalanches

clear all
clc
N=50; %Raiz do numero de elementos (A rede vai ter NxN elementos)
sig=0.933; %branch
d=0; %desvio da distribuição do branch
Nava=10000; %Número de avalanches
I=1; %Input inicial


[M,Mp,sigs]=redeall_bi(N,sig,d);

name='avalanches';
%-------- || Gera as Nava Avalanches   || --------------%
for i=1:Nava
    clc    
    disp(name)
    disp(i)
    Ma=Atividade2_driven(Mp,sigs,I);
    S(i)=struct('Atividade',Ma);    
end
%**********************************************************




%ATENÇÃO: Os passos seguintes servem apenas para fazer com que todos as
%avalanches tenham a mesma dimensão para facilitar o calculo da
%similaridade

%Acha o tmáximo
tmax=0;
for i=1:Nava
    if length(S(i).Atividade(1,:))>tmax
        tmax=length(S(i).Atividade(1,:));
    end
end
%******************************************

%-----|| Faz com que todos as matrizes tenham duração igual a tmax ||-----
name='Organizando';
for i=1:Nava
    disp(i)
    disp(name)
    if length(S(i).Atividade(1,:))<=tmax
        
        Ma=sparse(S(i).Atividade);
        dif=tmax-length(Ma(1,:));
        Ma=sparse(Ma);
        Ma(:,length(Ma(1,:))+dif)=zeros(N^2,1);
        S1(i)=struct('Atividade',Ma);
    end
end
%************************************************************************
S=S1;
clearvars -except S 
