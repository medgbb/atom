%% vmd.m
% * This function plots the atom struct in VMD. 
% * Make sure to edit your own PATH2VMD function!!!
% * Tested 15/04/2017
% * Please report bugs to michael.holmboe@umu.se

%% Examples
% * vmd(atom,Box_dim)
% * vmd('filename.gro')
% * vmd('filename.pdb')

function vmd(varargin)

if nargin==1
    filename=varargin{1};
    system(strcat(char({PATH2VMD()}),char(strcat({' '},{filename}))));
else
    atom=varargin{1};
    Box_dim=varargin{2};
    if numel(Box_dim)==1
        Box_dim(1)=Box_dim(1);
        Box_dim(2)=Box_dim(1);
        Box_dim(3)=Box_dim(1);
    end
    write_atom_gro(atom,Box_dim,'temp_out.gro');
    system(strcat(char({PATH2VMD()}),char(strcat({' '},{'temp_out.gro'}))));
end

