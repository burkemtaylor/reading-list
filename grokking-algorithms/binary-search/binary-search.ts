console.log("running...");

const assert = (condition: boolean, message?: string) => {
  if (!condition) {
    throw new Error(message);
  }
};

const binarySearch = (sortedArray: number[], target: number): number => {
  const index = Math.floor((sortedArray.length - 1) / 2);
  const value = sortedArray.at(index);

  assert(Boolean(value), "Value is undefined");

  console.log(`[${index}]: ${value}`);

  if (value === target) {
    return index;
  } else if (value && value > target) {
    return binarySearch(sortedArray.slice(0, index), target);
  } else {
    return index + binarySearch(sortedArray.slice(index + 1), target) + 1;
  }
};

const sortedArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const sortedArrayLarge = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
const sortedArrayLarger = [
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
  28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51,
  52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75,
  76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,
  100,
];
const target = 5;
console.log(binarySearch(sortedArray, 5));
console.log(binarySearch(sortedArrayLarge, 17));
console.log(binarySearch(sortedArrayLarger, 77));
console.log(binarySearch(sortedArrayLarger, 49));
