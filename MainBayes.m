load iris.dat
nCols = size(iris, 2); % calculates no of cols for iris dataset
nRows = size(iris, 1); % calculates no of rows for iris dataset
n_bins = 5;
discretized_test_input = [4 3 3 1];

discretized_iris = [];

for x = 1:size(iris, 2) - 1
    M = iris(:, x);
    binEdges = linspace(min(M),max(M),n_bins+1);    
    discretized_iris = [discretized_iris discretize(M, binEdges)]; %#ok<AGROW>
end

discretized_iris(:, 5) = iris(:, 5);
random_setosa_data = discretized_iris(randperm( 50), :);
other_data = discretized_iris(51:150, :);
random_other_data = other_data(randperm(100),:);

n_pos=0;

training_examples = [
    random_setosa_data(1:25,:);random_other_data(1:50, :)];
testing_examples = [random_setosa_data(26:50, :);random_other_data(51:100, :)];

for i=1:size(testing_examples, 1)
    value=NaiveBayes(training_examples,testing_examples(i, 1:4));
    if(((strcmp(value, 'yes') && testing_examples(i, 5) == 1) || (strcmp(value, 'no') && testing_examples(i, 5) ~= 1)))
        n_pos = n_pos + 1;
    end
end
accuracy = n_pos/size(testing_examples,1);

