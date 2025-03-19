const storeItems = [
  { name: "Apple", price: 1.0 },
  { name: "Banana", price: 0.5 },
  { name: "Orange", price: 0.75 },
  { name: "Milk", price: 2.0 },
  { name: "Bread", price: 2.5 },
];

const cache: Object = {};

const getPrice = (name: string): number => {
  if (cache[name]) {
    return cache[name];
  }

  return storeItems.find((val) => val.name === name)?.price || 0;
};
