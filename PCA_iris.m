data = iris_dataset;
[row, col] = size(data);

% centralize iris data
% iris dataset has a high dimension, 

data_hat = data - mean(data,2);
C = (data_hat * data_hat')/ col;
[W, D] = eig(C);


% n is the number op principle components
n = 2;
eig_val = diag(D);
[eig_val, index] = sort(eig_val, 'descend');
W_PCA = W(:,index(1:n));

Y = W_PCA' * data;

% plot dataset and principle components
figure(1)
plot(Y(1,:),Y(2,:),'*');
figure(2)
plot(data(1,:),data(2,:),'*');



