# Fundamental Algorithms

## 3.1 Linear Regression

* Collection of labeled examlpe {(x y)} with a size of the collection N, where x is the D-dimensional feature vector and y is the real-valued target

* We want to build a model f(x) where f(x) = **wx** + *b*

![Linear Regression](images/ch3/1dlr.png)

* loss function -> measures the difference between the model and the target
* squared error loss -> (f(x) - y)<sup>2</sup>
* binary loss -> 1 if f(x) - y > 0 else 0

Within linear regression, the average loss is also called empirical risk

* Overfitting -> matches examples from the training data but has failed to capture the underlying structure of the data

## 3.2 Logistic Regression

Hinges on there being a positive label 1 and a negative label 0 and we then can build a single function with a codomain of (0,1).

f(x) = 1 / (1 + e<sup>-x</sup>)

The above is the standard logistic function / sigmoid function.

f(x) = 1 / (1 + e<sup>-(wx + b)</sup>)

The logistic regression model. Its optimization criterion is referred to as maximum likelihood.

![Maximum Likelihood](images/ch3/ml.png)

Gradient descent is used to find the parameters of the model but is not discussed in this chapter.

## 3.3 Decision Tree Learning

A decision tree operates via branching from a root node, each 'branch' is a feature *i* and each 'leaf' is a class label.

* Fair to say you could view it as a series of if-else statements

There are various ways to build a decision tree, the example included here is ID3 (Iterative Dichotomiser 3).

### ID3 Optimization

![ID3 Optimization](images/ch3/id3-optimization.png)

### ID3 Building Algorithm

![ID3 Tree](images/ch3/id3.png)

In building the decision tree, we start with the root node and then recursively split the data into two groups based on the value of the feature.

We evaluate the 'quality' of the split via its 'entropy', the degree of uncertainty about a random variable. We try to find the value of the feature that minimizes the entropy, or that maximizes the information gain.

## 3.4 Support Vector Machine

Mentioned before, but it is important to note a couple cases where the SVM is not appropriate: when the data is not linearly separable. This could be due to noise (outliers) or a non-linear relationship between the features and the target.

![Non-linearly Separable](images/ch3/svm.png)

### 3.4.1 Dealing with Noise

The **hinge loss function** is used to deal with noise. It is defined as:

f(x) = max(0, 1 - y<sub>i</sub> (**w**x<sub>i</sub> - *b*)

We then try to minimize the cost function: 

C ||w||<sup>2</sup> + 1/N sum<sub>i=1</sub><sup>N</sup> max(0, 1 - y<sub>i</sub> (**w**x<sub>i</sub> - *b*))

As C decreases, the SVM will shrink the margin between the two classes in order to reduce the error and accommodate noise. Reducing the margin reduces the generalization captured by the model.

### 3.4.2 Dealing with Non-Linearity

SVMs can use a function to 'implicitly' "transform the original space into a higher dimenion space." This is done via the 'kernel trick.' We don't inherently know what the kernel function must be for a given data set.

![Kernel Trick](images/ch3/3dsvm.png)

The generalized approach to solving this optimiziation problem is *Lagrange multipliers.*

![Lagrange Multipliers](images/ch3/lagrange.png)

There are multiple kernel functiosn that can be used, but the most commonly used is the **radial basis function kernel.**

![Radial Basis Function Kernel](images/ch3/rbfkernel.png)

## 3.5 K-Nearest Neighbors

Intuitively named, this algorithm is used to find the most commonly occurring label for a given feature vector via its 'closeness.' *Cosine similarity* is a popular metric used to measure the similarity between two vectors.

![Cosine Similarity](images/ch3/cos-similarity.png)