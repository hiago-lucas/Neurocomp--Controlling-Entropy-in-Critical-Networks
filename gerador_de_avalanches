%Gera struct com avalanches
clear all
clc
N=50;
sig=0.933;
d=0;
Nava=100;
I=1;

[M,Mp,sigs]=redeall_bi(N,sig,d);

name='avalanches';
for i=1:Nava
    clc
    
    disp(name)
    disp(i)
    Ma=Atividade2_driven(Mp,sigs,I);
    S(i)=struct('Atividade',Ma);    
end

tmax=0;
for i=1:Nava
    if length(S(i).Atividade(1,:))>tmax
        tmax=length(S(i).Atividade(1,:));
    end
end

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
S=S1;
clearvars -except S 
