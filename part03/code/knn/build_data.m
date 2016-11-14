load('hack_data.mat');
x = extract_image('train/18');
show_image(x)
%%
X_train = [X_train, x]
y_train=[y_train,[4 2 2 0 6]]
save('hack_data.mat', 'X_train', 'y_train');