# Basic Practice

## 5.1 Feature Engineering

Given raw data, we need to transform it into a form that can be used by the learning algorithm. Build the dataset.

### 5.1.1 One-Hot Encoding

Consider increasing dimensionality rather than iterating over a single dimension.

"If the order of a feature's values is not important, using ordered numbers as values is likely to confused the learning algorithm."

The example provided is if a feature "colors" has 3 potential values. Increasing each to a single dimension of 0 or 1 helps to avoid confusing the learning algorithm.

### 5.1.2 Binning (or Bucketing)

Essentially, binning is a way to group similar values together. You can decide these 'bins' yourself.

### 5.1.3 Normalization

The process of converting the actual range into a standardized range of [-1,1] or [0,1] (most often).

### 5.1.4 Feature Selection

Rescaling a feature to create a standard normal distribution.

### 5.1.5 Dealing with Missing Features

* Sometimes can simply remove examples with missing features
* Some algorithms can handle missing features
* "Data imputation" techniques

### 5.1.6 Data Imputation Techniques

Can use an average value, build a regression model to find the missing value, or increase dimensionality with a binary indicator of whether or not the feature is missing.

To me, it feels like using a regression model could risk introducing bias into the model.

## 5.2 Learning Algorithm Selection

### Explainability

* Some algorithms operate closer to 'black boxes,' while others are more transparent.

### In-memory vs. out-of-memory

* If the full dataset is too large to fit into memory, then you would prefer to use an out-of-memory algorithm / incremental learning algorithm.

### Numbers of features and examples 

* Some algorithms are better suited for larger datasets such as neural networks and gradient boosting.

### Categorical vs. numerical features

* Once again, some algorithms are better suited for categorical features vs. numerical ones.

### Nonlinearity of the data

* Algorithms like SVMs can more easily handle linear data, whereas nueral networks and ensemble algorithms are better suited.

### Training speed

* Some algorithms simply take longer to train than others.
* Feels to me like an odd breakpoint to impose on choosing a learning algorithm.

### Prediction speed

* Once models are generated, some algorithms are faster at calculating predictions than others.
* SVMs, linear and logstic regression, some types of neural networks are faster
* kNN, ensemble algorithms, very deep or recurrent neural networks are slower

## 5.3 Three Sets

In practice, a 'dataset' is more often split into three sets:

* training set
* validation set
* test set

This allows you to verify the model's performance and to avoid overfitting.

## 5.2 Underfitting and Overfitting

* Underfitting: the model is too simple for the data
  * e.g. a linear model to represent a quadratic relationship
* Overfitting: the model is too complex for the data
  * e.g. a high-degree polynomial to represent a quadratic relationship

## 5.5 Regularization

* Encompasses methods that incentivize the model to err on the side of simplicity.
* Two most commonly used methods are:
  * L1 regularization
  * L2 regularization

## 5.6 Model Performance Assessment

Methodologies to evaluate the performance of a model.

One simple method is to compare the MSE (mean squared error) between the training data and test data. If the MSE is significantly higher on the training data, then the model is overfitting.

Common metrics for assessing classification models include:

* confusion matrix
* accuracy
* cost-sensitive accuracy
* precision/recall
* area under the ROC curve

### 5.6.1 Confusion matrix

A table assessing the true positive, true negative, false positive, and false negative rates for a classification model.

### 5.6.2 Precision/Recall

Precision: the ratio of true positives to the sum of true positives and false positives.
Recall: the ratio of true positives to the sum of true positives and false negatives.

### 5.6.3 Accuracy

The number of true positives plus the number of true negativies divided by the total number of examples.

### 5.6.4 Cost-sensitive accuracy

Examples where the cost of a false positive is higher than the cost of a false negative are given a higher weight for models where different classifications are more costly than others. A commonly used example is diagnosing a disease, where a false negative could be more costly to a patient than a false positive.

### 5.6.5 Area under the ROC curve (AUC)

ROC: Receiver Operating Characteristic

ROC curve: a plot of the true positive rate against the false positive rate.

TPR = TP / (TP + FN)
FPR = FP / (FP + TN)

## 5.7 Hyperparameter Tuning

Data analysts find a hyperparameter (for example using grid search) and can then use this hyperparameter to assist in the training process.

Other techniques for seeking a hyperparameter include:

* bayesian optimization
* random search

### 5.7.1 Cross-Validation

Create a series of 'folds' out of training data, subsets of the training data, to then iteratively build the model and assess its performance.