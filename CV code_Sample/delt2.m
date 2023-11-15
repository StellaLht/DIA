function laplace_u = delt2(u)
%delta2(f)=fxx+fyy
%这个方法和del2函数看似都实现了拉普拉斯算子，实则差距很大
% 计算偏导数
du_dx = gradient(u, 0.1, 2); % 对 x 求偏导
du_dy = gradient(u, 0.1, 1); % 对 y 求偏导

% 计算二阶偏导数之和（Laplace 算子）
laplace_u = gradient(du_dx, 0.1, 2) + gradient(du_dy, 0.1, 1);

end