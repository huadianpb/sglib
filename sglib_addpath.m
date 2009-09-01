function basepath=sglib_addpath( basepath, restore, add_experimental_path, add_octave_path )
% SGLIB_ADDPATH Set paths for sglib.
%   SGLIB_ADDPATH( BASEPATH, RESTORE, EXPERIMENTAL, OCTAVE ) adds paths for sglib to the
%   normal search path. If OCTAVE (default: FALSE) is true the path to the
%   octave compatibility directory (octcompat) is added. If EXERIMENTAL
%   (default: FALSE) is true the path to experimental directory is added.
%   If RESTORE (default: FALSE) is specified, the path is first reset to
%   its default.
%   This function is usually run rom the startup script SGLIB_STARTUP.
%
% Example (<a href="matlab:run_example sglib_addpath">run</a>)
%   % set default paths and return base path
%   p=sglib_addpath
%   % set default plus experimental path (but no octave)
%   sglib_addpath( [], true, true, false )
%   % set default plus octave path (but no experimental) resetting the path
%   % first
%   sglib_addpath( [], true, false, true )
%
% See also SGLIB_STARTUP, ADDPATH, STARTUP

%   Elmar Zander
%   Copyright 2007, Institute of Scientific Computing, TU Braunschweig.
%   $Id$
%
%   This program is free software: you can redistribute it and/or modify it
%   under the terms of the GNU General Public License as published by the
%   Free Software Foundation, either version 3 of the License, or (at your
%   option) any later version.
%   See the GNU General Public License for more details. You should have
%   received a copy of the GNU General Public License along with this
%   program.  If not, see <http://www.gnu.org/licenses/>.

% set default arguments
if nargin<2 || isempty(restore)
    restore=true;
end
if nargin<3 || isempty(add_experimental_path)
    add_experimental_path=false;
end
if nargin<4 || isempty(add_octave_path)
    add_octave_path=false;
end

% determine basepath if not given
if nargin<1 || isempty(basepath)
    basepath=fileparts( mfilename('fullpath') );
end

% set standard paths
if restore
    restoredefaultpath;
end

addpath( basepath );
addpath( [basepath '/munit'] );
addpath( [basepath '/doc'] );
addpath( [basepath '/plot'] );
addpath( [basepath '/util'] );
addpath( [basepath '/tensor'] );
addpath( [basepath '/simplefem'] );

if add_octave_path
    addpath( [basepath '/octcompat'] );
end

if add_experimental_path
    addpath( [basepath '/experimental'] );
end

rehash;

% suppress output argument if unwanted
if nargout==0
    clear basepath;
end