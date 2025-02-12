package binary_search

import "core:fmt"
import "core:math"

main :: proc() {
	sorted_array :: []i32{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	fmt.println(binary_search(sorted_array, 5))

	sorted_array_large :: []i32 {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
	}
	fmt.println(binary_search(sorted_array_large, 17))

	sorted_array_larger :: []i32 {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		23,
		24,
		25,
		26,
		27,
		28,
		29,
		30,
		31,
		32,
		33,
		34,
		35,
		36,
		37,
		38,
		39,
		40,
		41,
		42,
		43,
		44,
		45,
		46,
		47,
		48,
		49,
		50,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		58,
		59,
		60,
		61,
		62,
		63,
		64,
		65,
		66,
		67,
		68,
		69,
		70,
		71,
		72,
		73,
		74,
		75,
		76,
		77,
		78,
		79,
		80,
		81,
		82,
		83,
		84,
		85,
		86,
		87,
		88,
		89,
		90,
		91,
		92,
		93,
		94,
		95,
		96,
		97,
		98,
		99,
		100,
	}
	fmt.println(binary_search(sorted_array_larger, 49))
}

binary_search :: proc(sorted_array: []i32, target: i32) -> i32 {
	index := i32(math.floor(f32(len(sorted_array) - 1) / 2))
	value := sorted_array[index]

	fmt.printf("[%d]: %d\n", index, value)

	if value == target {
		return index
	} else if value > target {
		return binary_search(sorted_array[:index], target)
	} else {
		return index + binary_search(sorted_array[index + 1:], target) + 1
	}
}
