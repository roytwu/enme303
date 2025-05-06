%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Gauss-Seidel method
%*              This function only works for 3 variables with 3 equations
%* History:     11/18/2021 initial version 
%*              05/05/2025 Adding more documentation
%* ========== ========== ==========

function out = gSeidel(itr, augA, sDigit)
    %* initial matrix for data storage and display purpose 
    %* 4 place holderss: i-th iteration, x1, x2, and x3 
    out = zeros(4, itr);  

    x1=0;
    x2=0;
    x3=0;
    for i= 1:itr
        x1 = (augA(1, end) -augA(1,2)*x2 -augA(1,3)*x3)/augA(1,1);
        x2 = (augA(2, end) -augA(2,1)*x1 -augA(2,3)*x3)/augA(2,2);
        x3 = (augA(3, end) -augA(3,1)*x1 -augA(3,2)*x2)/augA(3,3);

        x1=round(x1, sDigit, 'significant');
        x2=round(x2, sDigit, 'significant');
        x3=round(x3, sDigit, 'significant');

        out(1,i) = i;
        out(2,i) = x1;
        out(3,i) = x2;
        out(4,i) = x3;
    end  
end   