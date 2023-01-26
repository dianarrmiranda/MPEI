function hash = DJB31MA_Modified(key, seed, K)
% implementation of the DJB31MA hash function based on the algorithm obtained
% in the 2014 summary (PJF) that is in C
%
%  key    array of characters with the key
%  seed   seed that allows you to get multiple hash codes for the same key
%
%  h      returned hashcode
    len = length(key);
    key = double(key);
    h = seed;
    for i = 1:len
        h = mod(31 * h + key(i), 2^32 - 1);
    end
    
    % added
    hash = zeros(1,K);
    for j = 1:K
        h = mod(31 * h + j, 2^32 - 1);
        hash(j) = h;
    end
end

%{
This function computes a hash value for an input key using the DJB31MA hash function. The input seed is used to seed the hashing process, and the resulting hash value is modified by adding the loop index j to it K times, where K is the input argument K. The final hash value is returned as the output hash.

The DJB31MA hash function is a simple hash function that takes an input key and produces a fixed-size output hash value. It is commonly used to quickly compare keys or to create hash tables.

In this particular implementation, the hash value is computed by iterating through each character in the input key, adding the ASCII value of the character to the current hash value, and then taking the modulo of the result with 2^32 - 1. This process is repeated for each character in the key. Then, the loop index j is added to the hash value K times, and the final result is stored in the output hash.
%}