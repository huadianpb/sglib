function t=tensor_to_vector(T)
% TENSOR_TO_VECTOR Short description of tensor_to_vector.
%   TENSOR_TO_VECTOR Long description of tensor_to_vector.
%
% Example (<a href="matlab:run_example tensor_to_vector">run</a>)
%
% See also

%   Elmar Zander
%   Copyright 2010, Inst. of Scientific Computing, TU Braunschweig
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version. 
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

if tensor_order(T)==2
    t=T{1}*T{2}';
    t=t(:);
else
    t=zeros(prod(tensor_size(T)),1);
    
    R=tensor_rank(T);
    for i=1:R
        u=elementary_tensor_to_vector( T, i );
        t=t+u;
    end
end

function u=elementary_tensor_to_vector( T, i )
d=length(T);
u=1;
for k=1:d
    u=revkron(u,T{k}(:,i));
end

