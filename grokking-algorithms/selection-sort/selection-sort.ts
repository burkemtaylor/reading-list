import { assert } from "../utilities/assert";

const selectionSort = (unsortedArray: number[]): number[] => {
  if (unsortedArray.length === 0) {
    return [];
  }

  if (unsortedArray.length === 1) {
    return unsortedArray;
  }

  let max: number = unsortedArray[0];
  let index: number = 0;

  unsortedArray.forEach((item, i) => {
    if (item > max) {
      max = item;
      index = i;
    }
  });

  assert(Boolean(max), "max is undefined");

  return [max, ...selectionSort(unsortedArray.filter((item) => item !== max))];
};

const unsortedArray: number[] = [2, 5, 1, 7, 8, 9, 3, 46, 0];
console.log(selectionSort(unsortedArray));
