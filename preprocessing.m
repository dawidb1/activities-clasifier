dataPath = 'pasek_aktywnosci';
folders = dir(dataPath);

for i=3:length(folders)
    all_devices_signal = load(folders(i).name);
    idx = find(all_devices_signal(:,1) == 0);

    accelerometer = all_devices_signal(idx,:);
    accelerometer = accelerometer(:,2:end);
    name = folders(i).name;
    preName = 'acc_';
    concat = strcat(preName, name);
    dlmwrite(concat, accelerometer);
end

%% 
personPath = dataPath + "\" + folders(personId).name

all_signals = load('damian_siedzenie.txt');

idx = find(all_signals(:,1) == 0)

accelerometer = all_signals(idx,:);

