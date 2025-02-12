# An Introduction to Algorithms

## Binary Search

### 1.1 Suppose you have a sorted list of 128 names, and you're searching through it using binary search. What's the maximum number of steps you'll have to make?

- 128 / 2 = 64
- 64 / 2 = 32
- 32 / 2 = 16
- 16 / 2 = 8
- 8 / 2 = 4
- 4 / 2 = 2
- 2 / 2 = 1

7 steps.

### 1.2 Suppose you double the size of the list. What's the maximum number of steps you'll have to make?

- 256 / 2 = 128
- 128 / 2 = 64
- 64 / 2 = 32
- 32 / 2 = 16
- 16 / 2 = 8
- 8 / 2 = 4
- 4 / 2 = 2
- 2 / 2 = 1

8 steps. One addition step due to ***O*** **(** *log* ***n*** **)** growth.

### 1.3 You have a name, and you want to find the person's phone number in the phone book.

***O*** **(** *log* ***n*** **)**

### 1.4 You have a phone number, and you want to find the perons's name in the phone book.

***O*** **(** ***n*** **)**

### 1.5 You want to read the numbers of every person in the phone book.

***O*** **(** ***n*** **)**

### 1.6 You want to read the numbers of just the *A*s.

***O*** **(** ***n*** **)**

### Traveling Salesman

***O*** **(** ***n***! **)**
