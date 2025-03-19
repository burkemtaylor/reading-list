package hash_table

import "core:fmt"

GroceryItem :: struct {
	name:  string,
	price: f32,
}

HashTable :: map[string]f32;

hash_table :: proc(items: []GroceryItem) -> HashTable {
	table := make(HashTable)

	for item in items {
		table[item.name] = item.price
	}

	return table
}

main :: proc() {
	groceryStore := []GroceryItem{
		{"apple", f32(1.0)},
		{"banana", f32(0.5)},
		{"orange", f32(0.75)},
		{"milk", f32(2.0)},
	}

    table := hash_table(groceryStore)

    fmt.println(table)
}
