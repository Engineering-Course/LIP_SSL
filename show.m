clear;
close all;
fclose all;
%%
load('human_colormap.mat');
data_root_folder = './human/data';
output_mat_folder = fullfile('./human/features/attention/val/fc8_mask');
save_result_folder = fullfile('./human/features/attention/val/results');
if ~exist(save_result_folder, 'dir')
    mkdir(save_result_folder);
end
output_dir = dir(fullfile(output_mat_folder, '*.mat'));
for i = 1 : numel(output_dir)
    if mod(i, 100) == 0
        fprintf(1, 'processing %d (%d)...\n', i, numel(output_dir));
    end
    data = load(fullfile(output_mat_folder, output_dir(i).name));
    raw_result = data.data;
    raw_result = permute(raw_result, [2 1 3]);
    
    img_fn = output_dir(i).name(1:end-4);
    img_fn = strrep(img_fn, '_blob_0', '');
    img = imread(fullfile(data_root_folder, 'images', [img_fn, '.jpg']));
    img_row = size(img, 1);
    img_col = size(img, 2);
    result = raw_result(1:img_row, 1:img_col);
    mask = uint8(result);
    imwrite(mask, colormap, fullfile(save_result_folder, [img_fn, '.png']));
end

      
