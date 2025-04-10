fileListStruct = dir('Pu*_datM1.mat');
if isempty(fileListStruct)
    error('cant find any Pu*_datM1.mat format，please check the path。');
end

bigDat = [];

for f = 1:length(fileListStruct)
    fname = fileListStruct(f).name;
    loadedData = load(fname, 'dat');
    if ~isfield(loadedData, 'dat')
        warning('file %s have no dat， ignore。', fname);
        continue;
    end

    bigDat = [bigDat; loadedData.dat(:)];
end

fprintf('you've merged %d trial.\n', length(bigDat));
