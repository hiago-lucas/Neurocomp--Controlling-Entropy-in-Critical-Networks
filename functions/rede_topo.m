function [M] = rede_topo(x,Ov,t)
    %Faz rede_topo
    %x= raiz do Número de elementos que serão conectados ll-to-all (x*x)
    %Ov= overlap
    %t= número de vezes que o overlap será aplicado
    
    
    N=x+t*Ov; %Quantidade de elementos total da rede
    M=zeros(N);%Cria a rede 
    t=t+1; %Deve ser feita mais uma vez para considerar o primeiro grupo de elementos
    Mref=M; %Matriz de referencia
    for i=1:length(M)^2
        Mref(i)=i; %Coloca numeração na matriz de referencia
    end    
    Mref=Mref';
    
    row=1;
    for i=1:t 
        if i>1
            row=row+Ov;
        end
        col=1;
        for j=1:t          
            if j>1
                col=col+Ov;
            end
            nodes=Mref(row:row+x-1,col:col+x-1); %Seleciona os nós que irão se conectar entre sí
            nodes=nodes(:)';
            %faz as conexoes
            for h=1:length(nodes)
                nodes1=nodes;
                nodes1(nodes1==nodes(h))=[]; %Elimina arcos
                M(nodes(h),nodes1)=1; 
                M(nodes1,nodes(h))=1;
            end
            
            
        end
    end
    
    
