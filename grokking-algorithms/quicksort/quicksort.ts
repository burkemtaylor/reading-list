const quicksort = (unsortedArray: number[]): number[] => {
  if (unsortedArray.length < 2) {
    return unsortedArray;
  }

  const pivot = unsortedArray[0];
  const left: number[] = [];
  const right: number[] = [];

  for (let item of unsortedArray) {
    if (item === pivot) {
      continue;
    } else if (item < pivot) {
      left.push(item);
    } else {
      right.push(item);
    }
  }

  return [...quicksort(left), pivot, ...quicksort(right)];
};

const unsortedArray: number[] = [2, 5, 1, 7, 8, 9, 3, 46, 0, -2];
console.log(quicksort(unsortedArray));
