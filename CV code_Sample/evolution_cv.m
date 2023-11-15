function phi = evolution_cv(I, phi0, mu, nu, lambda_1, delta_t, epsilon, numIter,g);
%   evolution_withoutedge(I, phi0, mu, nu, lambda_1, lambda_2, delta_t, delta_h, epsilon, numIter);
%   input: 
%       I: input image
%       phi0: level set function to be updated ׼�������µ�ˮƽ������
%       mu: weight for length term    ����u
%       nu: weight for area term, default value 0   ����v
%       lambda_1:  weight for c1 fitting term   ������1
%       lambda_2:  weight for c2 fitting term   ������1
%       delta_t: time step                      
%       epsilon: parameter for computing smooth Heaviside and dirac function
%       numIter: number of iterations   ��������
%   output: 
%       phi: updated level set function
%  
%   created on 04/26/2004
%   author: Chunming Li
%   email: li_chunming@hotmail.com
%   Copyright (c) 2004-2006 by Chunming Li



I = BoundMirrorExpand(I); % �����Ե����?Ϊʲô��Ҫ�����Ե���أ�Ϊ�˲���ʧ��Ϣ��
phi = BoundMirrorExpand(phi0);
g = BoundMirrorExpand(g);


for k = 1 : numIter 
    phi = BoundMirrorEnsure(phi);    %�����Եȷ��
    g = BoundMirrorEnsure(g);

    delta_h = Delta(phi,epsilon);    
    Curv = curvature(phi);           %���ʹ�ʽ
    delta_p = del2(phi);             %������˹����
              
    [gx,gy]=gradient(g);
    [phix,phiy]=gradient(phi); 

    norm=sqrt(phix.^2 + phiy.^2 + 1e-10);
    phixn=phix./norm;phiyn=phiy./norm;
    % updating the phi function 
    phi=phi+delta_t*(mu*(4*delta_p-Curv)+lambda_1*delta_h.*(gx.*phixn+gy.*phiyn+g.*Curv)+nu*g.*delta_h);
end
phi = BoundMirrorShrink(phi); % ȥ�����صı�Ե

