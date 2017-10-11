%% remove_resname.m
% * This function removes residue with molid MolID and residue names resnames 
% * Tested 15/04/2017
% * Please report bugs to michael.holmboe@umu.se

%% Examples
% * atom = remove_resname(atom,{'SOL' 'Protein'})


function atom = remove_resname(atom,resnames)

for i=1:size(resnames,2)
     atom(strcmp([atom.resname],resnames(i)))=[];
end

atom=atom_update(atom);
composition_atom(atom);