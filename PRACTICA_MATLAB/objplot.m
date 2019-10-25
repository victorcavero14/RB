% Routine to plot wireframe view of object defined using
% vertex and edge arrays.
%
% USAGE:  OBJPLOT(vert, edge, nvert, nedge, s)
%
%      vert = object vertex array  [4 x nvert]
%      edge = object edge connectivity [nedge x 2]
%     nvert = number of vertices
%     nedge = number of edges
%         s = optional string containing line information
%             (eg. colour)
%
% In the generated view, the world axes are colour coded as follows:
%      X = green
%      Y = cyan
%      Z = red
% In addition, a small circle is plotted at the positive end of each axis.
%
% The view angles can be changed with the view() command, or interactively
% using the uinew function.
% 
%
% See also:  objdef, objlib, uinew



function objplot(vert,edge,nvert,nedge,s)

% select yellow if colour not specified in s
if nargin<5 
   s = 'y';
end

% set some plotting limits
  axis([-10 10 -10 10 -10 10])
  axis('equal')

  
% Plot some axis lines centered at the origin
% x axis
  plot3([-10 10], [0 0], [0 0],'g')
%  axis equal
  axis off
  hold on
  plot3(10,0,0,'go')
  xlabel('X')
  ylabel('Y')
  zlabel('Z')


%y axis
  plot3([0 0],[-10 10], [0 0],'c')
  plot3(0,10,0,'co')
%z axis
  plot3([0 0],[0 0], [-10 10],'r')
  plot3(0,0,10,'ro')

for ie=1:nedge
  v1 = edge(ie,1);
  v2 = edge(ie,2);
  x = [vert(1,v1) vert(1,v2)];
  y = [vert(2,v1) vert(2,v2)];
  z = [vert(3,v1) vert(3,v2)];
  plot3(x,y,z,s)
end

view(30,30)



