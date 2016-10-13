%Plots a grid and numerical values inside the cells of the grid
%function hw3_plotValueGrid(xx,yy,val)
%Inputs
%   xx  Vector of dimension [N+1] with the x coordinates of the lines of
%       the grid
%   yy  Vector of dimension [M+1] with the y coordinates of the lines of
%       the grid
%   val Array of dimensions [M,N] with the values to insert in the grid
function hw3_plotValueGrid(xx,yy,val)
%dimensions
N=length(xx)-1;
M=length(yy)-1;
%extrema for drawing the lines
extX=[min(xx) max(xx)];
extY=[min(yy) max(yy)];
%save hold state
flagHold=ishold();
%plot grid lines
for iX=1:N+1
    plot([xx(iX) xx(iX)],extY,'k');
    hold on
end
for iY=1:M+1
    plot(extX,[yy(iY) yy(iY)],'k');
end
for iX=1:N
    for iY=1:M
        t=text(mean(xx(iX:iX+1)),mean(yy(iY:iY+1)),...
            num2str(val(iY,iX)),...
            'HorizontalAlignment','center');
    end
end


%restore hold state
if ~flagHold
    hold off
end
