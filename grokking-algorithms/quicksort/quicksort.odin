package quicksort

import "core:fmt"

main :: proc() {
	unsorted_array := make([dynamic]i32, 0, context.allocator)
	append(&unsorted_array, 2, 5, 1, 7, 8, 9, 3, 46, 0, -2)
	fmt.println(unsorted_array)

	fmt.println(quicksort(unsorted_array))

	free_all(context.allocator)
}

quicksort :: proc(unsorted_array: [dynamic]i32) -> [dynamic]i32 {
	if len(unsorted_array) < 2 {
		return unsorted_array
	}

	pivot := unsorted_array[0]
	left := make([dynamic]i32, 0, context.allocator)
	right := make([dynamic]i32, 0, context.allocator)

	for item, i in unsorted_array {
		if item == pivot {
			continue
		} else if item < pivot {
			append(&left, item)
		} else {
			append(&right, item)
		}
	}

	return join(quicksort(left), join([dynamic]i32{pivot}, quicksort(right)))
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
