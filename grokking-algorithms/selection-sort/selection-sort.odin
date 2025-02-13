package selection_sort

import "core:fmt"

main :: proc() {
	unsorted_array := make([dynamic]i32, 0, context.allocator)
	append(&unsorted_array, 2, 5, 1, 7, 8, 9, 3, 46, 0, -2)
	fmt.println(unsorted_array)

	fmt.println(selection_sort(unsorted_array))

	free_all(context.allocator)
}

selection_sort :: proc(unsorted_array: [dynamic]i32) -> [dynamic]i32 {
	if len(unsorted_array) == 0 {
		return make([dynamic]i32, 1, context.allocator)
	}

	if len(unsorted_array) == 1 {
		return unsorted_array
	}

	max: i32
	index: int

	for item, i in unsorted_array {
		if i32(item) > max {
			max = i32(item)
			index = i
		}
	}

	return join(selection_sort(remove_element(unsorted_array, index)), [dynamic]i32{max})
}

remove_element :: proc(array: [dynamic]i32, index: int) -> [dynamic]i32 {
	pruned_array := make([dynamic]i32, 0, context.allocator)

	for item, i in array {
		if i != index {
			append(&pruned_array, item)
		}
	}

	return pruned_array
}

join :: proc(array1: [dynamic]i32, array2: [dynamic]i32) -> [dynamic]i32 {
	joined_array := make([dynamic]i32, len(array1) + len(array2), context.allocator)

	for item, i in array1 {
		joined_array[i] = item
	}

	for item, i in array2 {
		joined_array[i + len(array1)] = item
	}

	return joined_array
}
