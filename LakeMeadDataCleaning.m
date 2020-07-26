load('LakeMeadDataRaw.mat');
hourList = LakeMeadDataRaw(1:end,4);
newLakesData = zeros(8760,18);
dataSize = 8760;
count = 0;
currentHour = 1;
missingData = 0;
emptyLine = 99999*ones(1,18);

for i = 1:dataSize
    
    if count == hourList(currentHour)
        newLakesData(i,1:end) = LakeMeadDataRaw(currentHour,1:end);
    else
        newLakesData(i,1:end) = emptyLine;
        missingData = missingData + 1;
        currentHour = i - missingData;
    end
     
    if count == 23
        count = 0;
    else
        count = count+1;
    end
    
    currentHour = currentHour + 1;    
end