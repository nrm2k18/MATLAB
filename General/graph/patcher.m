function [ h ] = patcher( t, low, high, C, inv, varargin )
%plots patches of time series in a more natural way
%
%[ h ] = patcher( t, low, high, C,varargin )
%
% Mathias Hauser @ IAC, Autumn 2012
%   v. 0.93

validateattributes(t,{'numeric'},{'vector'})
validateattributes(low,{'numeric'},{'vector'})
validateattributes(high,{'numeric'},{'vector'})

assert(isequal(size(t), size(low), size(high)), 'patcher:notEqInp', ...
    'The input needs to have the same size/ dimensions')

if size(t,1) ~= 1
    t = t';
    low = low';
    high = high';
end

if nargin < 4 || isempty(C)
    C = 'b';
end

if nargin < 5 || isempty( inv )
    inv = false;
end
    
    


t = [t fliplr(t) t(1)];
val = [low, fliplr(high), low(1)];

if inv
    X = val;
    Y = t;
else
    X = t;
    Y = val;
end



if nargout == 0
    patch( X, Y, C, varargin{:});
else
   h = patch( X, Y, C, varargin{:});
end





end

