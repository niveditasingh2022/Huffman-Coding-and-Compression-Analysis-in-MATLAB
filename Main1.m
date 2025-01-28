% Nivi1.m script
clear all
%(Follwing Probabilities are optimized to check given enetroy and compression ratio)
p0 = 0.2;        % Probability of 0
p1 = 0.8;        % Probability of 1

% Generate a random data length between 1000 and 10000 bits as given in
% term project
data_length = randi([1000, 10000]);

% Generate random values between 0 and 1
rand_values = rand(1, data_length);

% Create binary sequence based on above chosen probabilities,(e.g. 0.2/0.8, 0.1/0.9, and 0.5/0.5 manually to evaluate)
binary_seq = int32(rand_values <= p1);

% Display the generated random binary sequence
disp('here are ---------------Generated Random Binary Sequence:');
disp(' ');  % Line break
disp(binary_seq.');

% Make binary Huffman code of short length
[symbols, ~, idx] = unique(binary_seq);
num_symbols = numel(symbols);
probs = hist(idx, 1:num_symbols) / numel(binary_seq);

if length(symbols) ~= length(probs)
    error('Symbol and probability vectors must have the same length.');
end

% Create Huffman dictionary for Huffman code
dict = huffmandict(symbols, probs);

% Encode the binary sequence as asked in term project
encoded_sequence = huffmanenco(binary_seq, dict);

% Calculate the compression ratio before increasing the length
compression_ratio = length(encoded_sequence) / length(binary_seq);

% Display Huffman Code
disp('Huffman Code:');
disp(dict);

% Display Compression Ratio
disp(['Compression Ratio before increase of block length: ', num2str(compression_ratio)]);

% Increase the block length and evaluate the compression rate (we chnaged manually 10000, 100000, etc.)
block_lengths = 1000:100:100000;
compression_ratios = zeros(length(block_lengths), 1);

for i = 1:length(block_lengths)
    % Check if block length exceeds remaining sequence length
    if block_lengths(i) <= length(binary_seq) - (i-1)*1000
        block = binary_seq((i-1)*1000+1 : i*1000);
        encoded_block = huffmanenco(block, dict);
        compression_ratios(i) = length(encoded_block) / length(block);
    else
        disp(['Block length exceeds remaining sequence length for block ', num2str(i)]);
    end
end

% Display Compression Ratios for Different Block Lengths
disp('Compression Ratios for Different Block Lengths:');
disp(compression_ratios.');

% Calculate the Entropy using the given formula
entropy = -sum(probs .* log2(probs));

% Display entropy value
disp(['Entropy value: ', num2str(entropy)]);

% Plot the compression ratio vs block length to evaluate and compare the
% results
figure;
plot(block_lengths, compression_ratios);
xlabel('Block length');
ylabel('Compression ratio');
title('Compression ratio vs block length');


% Plot the compression ratio vs block length to evaluate and compare the
% results
hold on;
plot(block_lengths, entropy * ones(size(block_lengths)), 'r--');
legend('Compression ratio', 'Entropy');
