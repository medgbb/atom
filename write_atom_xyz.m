%% write_atom_xyz.m
% * This function writes an xyz file from the atom struct
% * Tested 15/04/2017
% * Please report bugs to michael.holmboe@umu.se

%% Examples
% * write_atom_xyz(atom,Box_dim,filename_out)


function write_atom_xyz(atom,Box_dim,filename_out)

if regexp(filename_out,'.xyz') ~= false;
    filename_out = filename_out;
else
    filename_out = strcat(filename_out,'.xyz');
end

if numel(Box_dim)==1
    Box_dim(1)=Box_dim(1);
    Box_dim(2)=Box_dim(1);
    Box_dim(3)=Box_dim(1);
end

nAtoms=size([atom.x],2)
fid = fopen(filename_out, 'wt');
fprintf(fid, '%-5i\r\n',nAtoms);

if length(Box_dim)==3
    fprintf(fid, '# %10.5f%10.5f%10.5f\r\n',Box_dim);
elseif length(Box_dim)==6
    fprintf(fid, '# %10.5f%10.5f%10.5f%10.5f%10.5f%10.5f\r\n',Box_dim);
elseif length(Box_dim)==9
    fprintf(fid, '# %10.5f%10.5f%10.5f%10.5f%10.5f%10.5f%10.5f%10.5f%10.5f\r\n',Box_dim);
end

for i = 1:nAtoms
    Atom_section(1:4) = [atom(i).type, atom(i).x, atom(i).y, atom(i).z];
    fprintf(fid, '%-5s%10.5f%10.5f%10.5f\r\n', Atom_section{1:4});
end

fprintf(fid, '\r\n');

fclose(fid);
disp('.xyz structure file written')