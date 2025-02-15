# All code is from the book "The Hundred Page Machine Learning Book"
# by Andriy Burkov

# This is generalized from the "spending & sales" example in the book
# and updates the parameters for a single epoch.
def update_parameters(x, y, w, b, learning_rate):
    dl_dw = 0.0
    dl_db = 0.0
    N = len(x)

    for i in range(N):
        dl_dw += -2*x[i]*(y[i] - (w*x[i] + b))
        dl_db += -2*(y[i] - (w*x[i] + b))

    # update w and b
    w = w - (1/float(N))*dl_dw*learning_rate
    b = b - (1/float(N))*dl_db*learning_rate

    return w, b

# Loop over multiple epochs
def train(x, y, w, b, learning_rate, epochs):
    for e in range(epochs):
        w, b = update_parameters(x, y, w, b, learning_rate)

        # log the progress
        if e % 400 == 0:
            print("Epoch: ", e, "loss: ", avg_loss(x, y, w, b))

    return w, b

def avg_loss(x, y, w, b):
    N = len(x)
    total_error = 0.0

    for i in range(N): 
        total_error += (y[i] - (w*x[i] + b))**2
    return total_error/float(N)

# Extremely simple example
x = [1, 2, 3, 4, 5]
y = [2, 4, 6, 8, 10]
w = 0.0
b = 0.0
learning_rate = 0.01
epochs = 1000

w, b = train(x, y, w, b, learning_rate, epochs)
print("w: ", w)
print("b: ", b)

# Also from the book, once we have established the parameters, we can
# use them to predict the target for a new example.

def predict(x, w, b):
    return w*x + b

# Example from the book itself
w, b = train(x, y, w, b, learning_rate, epochs)
x_new = 23.0
y_new = predict(x_new, w, b)
print("y_new: ", y_new)